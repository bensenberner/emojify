import cv2
import copy
from scipy import spatial
imagePath = "/Users/benjaminlerner/emoji/emoji-extractor/images/160x160/220.png"
imagePath2="/Users/benjaminlerner/emoji/emoji-extractor/images/160x160/200.png"
filename = "222large.png"
filename2 = 'newpic'

image = cv2.imread(imagePath)
hist = cv2.calcHist([image], [0, 1, 2], None, [8, 8, 8],
        [0, 256, 0, 256, 0, 256])
histCopy = copy.deepcopy(hist)
hist = cv2.normalize(hist, histCopy).flatten()

image2 = cv2.imread(imagePath2)
hist2 = cv2.calcHist([image2], [0, 1, 2], None, [8, 8, 8],
        [0, 256, 0, 256, 0, 256])
histCopy2 = copy.deepcopy(hist2)
hist2 = cv2.normalize(hist2, histCopy2).flatten()
d = spatial.distance.euclidean(hist, hist2)
print d
