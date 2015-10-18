import cv2
from scipy import spatial
imagePath = "/Users/benjaminlerner/emoji/emoji-extractor/images/20x20/2.png"
imagePath2="/Users/benjaminlerner/emoji/emoji-extractor/images/20x20/4.png"
filename = "222large.png"
filename2 = 'newpic'

image = cv2.imread(imagePath)
hist = cv2.calcHist([image], [0, 1, 2], None, [8, 8, 8],
        [0, 256, 0, 256, 0, 256])
hist = cv2.normalize(hist, hist).flatten()

image2 = cv2.imread(imagePath2)
hist2 = cv2.calcHist([image2], [0, 1, 2], None, [8, 8, 8],
        [0, 256, 0, 256, 0, 256])
hist2 = cv2.normalize(hist2, hist2).flatten()
d = spatial.distance.euclidean(hist, hist2)
print d
