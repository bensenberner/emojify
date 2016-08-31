import cv2
import os
import shutil
from scipy import spatial
# imagePath = "/Users/benjaminlerner/emoji/emoji-extractor/images/20x20/2.png"
# imagePath2="/Users/benjaminlerner/emoji/emoji-extractor/images/20x20/4.png"
# exampleImgPath="/Users/benjaminlerner/emojify/test/pic48015.png"
emojiDir="/Users/benjaminlerner/emojify/20x20"
picsDir="/Users/benjaminlerner/emojify/test"
resultDir="/Users/benjaminlerner/emojify/result"

# exampleImage = cv2.imread(exampleImgPath)
# exhist = cv2.calcHist([exampleImage], [0, 1, 2], None, [8, 8, 8], [0, 256, 0, 256, 0, 256])
# exhist=cv2.normalize(exhist, exhist).flatten()
# filename = "222large.png"
# filename2 = 'newpic'

def emojify(gridDir):
    for subdir, dirs, files in os.walk(gridDir):
        count = 0
        for f in files:
            picturePath = subdir + os.sep + f
            picTuple = findSimilarPic(emojiDir, createHist(picturePath))
            num = "%04d" % count
            newFile = resultDir + os.sep + "pic" + str(num) + ".png"
            shutil.copy(picTuple[0], newFile)
            count = count + 1

def createHist(path):
    img = cv2.imread(path)
    hist = cv2.calcHist([img], [0, 1, 2], None, [8, 8, 8], [0, 256, 0, 256, 0, 256])
    hist = cv2.normalize(hist, hist).flatten()
    return hist

def findSimilarPic(directory, inHist):
    similarPic = ("", 1000)

    for subdir, dirs, files in os.walk(directory):
        for f in files:
            # print subdir + os.sep + img
            imagePath = subdir + os.sep + f
            hist = createHist(imagePath)
            dist = spatial.distance.euclidean(hist, inHist)
            if dist < similarPic[1]:
                similarPic = (imagePath, dist)

    return similarPic

emojify(picsDir)

        # image = cv2.imread(
# image = cv2.imread(imagePath)
# hist = cv2.calcHist([image], [0, 1, 2], None, [8, 8, 8],
        # [0, 256, 0, 256, 0, 256])
# hist = cv2.normalize(hist, hist).flatten()

# image2 = cv2.imread(imagePath2)
# hist2 = cv2.calcHist([image2], [0, 1, 2], None, [8, 8, 8],
        # [0, 256, 0, 256, 0, 256])
# hist2 = cv2.normalize(hist2, hist2).flatten()
# d = spatial.distance.euclidean(hist, hist2)
# print d
