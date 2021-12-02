#import required libraries
import cv2          
import numpy as np
import mysql.connector
import calendar
import time
import os

# 'tkinter' is used to create the GUI
from tkinter import * #import all libraries in tkinter
class MyWindow:       #main class
    def __init__(self, win):        # initialize method
        # promt to take user inputs
        self.lbl1=Label(win, text='User Id:')
        self.lbl2=Label(win, text='Weight in lb:')
        self.lbl3=Label(win, text='Message:')
        self.lbl4=Label(win, text='****Press "Space" to capture photo or "Escape" to cancel****') 
        # when "Space" is pressed image would be captured, when "Escape" is pressed the widow is cancelled
        self.t1=Entry(bd=3) #Take user input
        self.t2=Entry()
        # create buttons
        self.btn1 = Button(win, text='Start Detection') 
        self.btn2=Button(win, text='Reset')
        #positioning elements
        self.lbl1.place(x=100, y=50)
        self.t1.place(x=200, y=50)
        self.lbl2.place(x=100, y=100)
        self.t2.place(x=200, y=100)
        # if button being pressed, call associated method
        self.b1=Button(win, text='Start Detection', command=self.startdetction) 
        self.b2=Button(win, text='Reset')
        self.b2.bind('<Button-1>', self.reset) 
        #positioning elements
        self.b1.place(x=100, y=150)
        self.b2.place(x=200, y=150)
        self.lbl3.place(x=20, y=220)
        self.lbl4.place(x=30, y=190)

        #creating the message box   
        self.t4 = Text(win, x=20, y=250, height=5, width=20,bg='yellow') # added one text box
        self.t4.grid(row=3,column=2) 
        self.t4.place(x=20, y=250,height=220, width=350)
        self.t4.bind("<1>", lambda event: self.t4.focus_set())

    # image capture, detection and database update
    def imgDetection(self):
        #connect with the MySQL database named "py_project"
        mydb = mysql.connector.connect(
          host="localhost",
          user="root",
          password="",
          database="py_project",
        )
        mycursor = mydb.cursor()

        # capture image using webcam
        cam = cv2.VideoCapture(0)
        cv2.namedWindow("Capture image")

        img_counter = 0
        itemName = ''

        while True:
            ret, frame = cam.read()
            if not ret:
                print("failed to grab frame")
                break
            cv2.imshow("Capture image", frame)

            k = cv2.waitKey(1)
            if k%256 == 27:
                # when ESC pressed
                print("Escape hit, closing...")
                break
            elif k%256 == 32:
                # when SPACE pressed and image capture
                #creating time-stamp to name every images
                gmt = time.gmtime()
                ts = calendar.timegm(gmt)
                img_name = str(ts)+".png"
                # saving the image file in the directory
                path = 'C:/xampp/htdocs/py_project/uploads'
                cv2.imwrite(os.path.join(path, img_name), frame)              


                # Image Detection
                # Load Yolo trained dataset
                net = cv2.dnn.readNet("yolov4-obj_best.weights", "yolov4-obj.cfg")
                classes = []
                with open("obj.names", "r") as f:
                    classes = [line.strip() for line in f.readlines()]
                output_layers = net.getUnconnectedOutLayersNames()
                colors = np.random.uniform(0, 255, size=(len(classes), 3))

                # Loading image
                img = cv2.imread(os.path.join(path, img_name))
                img = cv2.resize(img, None, fx=0.4, fy=0.4)
                height, width, channels = img.shape

                # Detecting objects
                blob = cv2.dnn.blobFromImage(img, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
                net.setInput(blob)
                outs = net.forward(output_layers)

                # Showing informations on the screen
                class_ids = []
                confidences = []
                boxes = []
                for out in outs:
                    for detection in out:
                        scores = detection[5:]
                        class_id = np.argmax(scores)
                        confidence = scores[class_id]
                        if confidence > 0.5:
                            # Object detected
                            center_x = int(detection[0] * width)
                            center_y = int(detection[1] * height)
                            w = int(detection[2] * width)
                            h = int(detection[3] * height)

                            # Rectangle coordinates
                            x = int(center_x - w / 2)
                            y = int(center_y - h / 2)
                            boxes.append([x, y, w, h])
                            confidences.append(float(confidence))
                            class_ids.append(class_id)

                indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.5, 0.4)
                font = cv2.FONT_HERSHEY_PLAIN
                for i in range(len(boxes)):
                    if i in indexes:
                        x, y, w, h = boxes[i]
                        label = str(classes[class_ids[i]])
                        color = colors[i]
                        cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
                        cv2.putText(img, label, (x, y + 30), font, 3, color, 3)
                        #detected object name
                        itemName = classes[class_ids[i]]

                        item_name_ck = ""
                        for x in itemName:
                            item_name_ck+= x
                 
                # showing the detected object in the image        
                cv2.imshow("Image", img)
                cv2.waitKey(0)
                cv2.destroyAllWindows()
                # release the camera
                cam.release()
                cv2.destroyAllWindows()


                # read the item related information from the database
                mycursor.execute("""SELECT * FROM `tbl_item_price` WHERE item_name = '%s'""" % (itemName))
                itemPriceInfo = mycursor.fetchone()
                
                # get the user inputs 
                userId = int(self.t1.get())
                userQty = float(self.t2.get())
                # read customer information from the database
                mycursor.execute("""SELECT * FROM `tbl_customer_accounts` WHERE customer_id = '%s'""" % (userId))
                userAccountInfo = mycursor.fetchone()

                # preparing the message to display
                result = "User Details:" + "\nUser Name: " + str(userAccountInfo[2]) + "\nAddress: " + str(userAccountInfo[4])+"\nBank Name: " + str(userAccountInfo[5])+"\nAccount No: " + str(userAccountInfo[3])+"\nCurrent Account Balance: " + str(userAccountInfo[6])

                # Calculte payable amount
                payAmount = float(itemPriceInfo[2]) * float(userQty)
                updatedAmount = float(userAccountInfo[6]) + float(payAmount)
                # adding more info in the message to display
                result = result+"\n\n"
                result = result +"Your customer Id: " + str(userId) + "\nDetected item: " + str(itemName) + "\nItem Price: " + str(itemPriceInfo[2]) +" (per lb)"+ "\nWeight: " + str(userQty) + "\nReceivable amount: " + str(payAmount) + " (item price * weight)"
                
                # Insert Image information into the database
                sql = "INSERT INTO tbl_image_info (`img_name`, `category`, `up_by`) VALUES (%s, %s, %s)"
                val = (img_name, itemName, userId)
                mycursor.execute(sql, val)
                mydb.commit()

                # update balance in user account
                sql_update = "UPDATE tbl_customer_accounts SET balance=%s WHERE customer_id=%s"
                val =  (updatedAmount, userId)
                mycursor.execute(sql_update, val)
                mydb.commit()
                mycursor.close ()
                mydb.close()
                result = result + "\nYour Updated Account Balance: "+ str(updatedAmount)
                #display message
                self.t4.insert(END, str(result)) 
                break

    # function to take user input and call the image detection function
    def startdetction(self):
            self.t4.delete(1.0,END) #erases previous info
            num1=int(self.t1.get()) #get the user inputs
            num2=float(self.t2.get())
            self.imgDetection() # calling the imgDetection function
            
    # function to erase the user iputs
    def reset(self, event):
        self.t4.delete(1.0,END)
        self.t1.delete(0, 'end')
        self.t2.delete(0, 'end')
        
# creating the window
window=Tk()
mywin=MyWindow(window)
window.title('Automated Vegetable Store')
window.geometry("400x500+10+10")
window.mainloop()
