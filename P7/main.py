import os

command = "java -jar Mars.jar db nc mc CompactDataAtZero a dump .text HexText textCode.txt test.asm"
os.system(command=command)
command = "java -jar Mars.jar db nc mc CompactDataAtZero a dump 0x4180-0x6ffc HexText handlerCode.txt test.asm"
os.system(command=command)

text = []
handler = []
line = 0
with open(file="textCode.txt") as textCode:
    text = textCode.read()
    line = text.count("\n")
with open(file="handlerCode.txt") as handlerText:
    handler = handlerText.read()
with open(file="sim/code.txt",mode="w") as code:
    code.write(text)
    for i in range(1120-line):
        code.write("00000000\n")
    code.write(handler)

command1 = "./compile.sh"
command2 = "./run.sh"
os.system(command=command1)

r = os.popen(command2)
res = r.read()
r.close
index = res.find("@")
if index != -1:
    res = res[index:-1]

with open(file="res.txt",mode="w") as out:
    out.write(res)

dm = {}

with open(file="res.txt",mode="r") as out:
    for line in out:
        index = line.find("*")
        if index != -1:
            dm[line[index+1:index+9]] = line[-9:-1]
            if line[-1] != "\n":
                dm[line[index+1:index+9]] = line[-8:]

dm = sorted(dm.items(),key=lambda x:x[0],reverse=False)


with open(file="data.txt",mode="w") as data:
    for x in dm:
        if str(x[1]).find("00000000") == -1:
            data.write("0x"+str(x[0])+" : 0x"+str(x[1])+"\n")

command = "java -jar /home/co-eda/MARS_CO/Mars.jar db nc ex lg mc CompactDataAtZero  P7_test/test.asm"
r = os.popen(command)
res = r.read()
r.close
index = res.find("@")
if index != -1:
    res = res[index:-1]

with open(file="mars.txt",mode="w") as out:
    out.write(res)

dm = {}

with open(file="mars.txt",mode="r") as out:
    for line in out:
        index = line.find("*")
        if index != -1:
            dm[line[index+1:index+9]] = line[-9:-1]
            if line[-1] != "\n":
                dm[line[index+1:index+9]] = line[-8:]

dm = sorted(dm.items(),key=lambda x:x[0],reverse=False)

with open(file="mars.txt",mode="w") as data:
    for x in dm:
        if str(x[1]).find("00000000") == -1:
            data.write("0x"+str(x[0])+" : 0x"+str(x[1])+"\n")

command = "diff -a data.txt  mars.txt"
r = os.popen(cmd=command)
if r.read() == "":
    print("Accepted")
else:
    print(r.read())