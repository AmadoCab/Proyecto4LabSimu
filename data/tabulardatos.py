import sys
import csv

document = str(sys.argv[1])

i = 0
with open(document, "r") as csvfile:
  thereader = csv.reader(csvfile, delimiter="\t")
  for row in thereader:
    if (i < 4 or i > 96):
      clean = [
        row[0],
        "\\num{{ {} }}".format(round(float(row[1]),3)),
        "\\num{{ {} }}".format(round(float(row[2]),3)),
        "\\num{{ {:.3g} }}".format(float(row[3]))
      ]
      if i == 100:
        print("&".join(clean), end=r"\relax")
      else:
        print("&".join(clean), end=r"\\")
    elif i == 4:
      print(r"\vdots & \vdots & \vdots & \vdots\\[.25em]")
    i += 1