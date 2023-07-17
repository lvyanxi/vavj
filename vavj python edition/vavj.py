import os

ENCRYPTED_MESSAGES = {
    "mkfile_error": "bmhmbnfu ojduibst，请输入 help 查看帮助",
    "addinfo_error": "bmjnb ojdujpo ibwf ”%s“ %s",
}

def encrypt_string(plaintext_string):
    encrypted_string = ""
    for char in plaintext_string:
        encrypted_string += chr(ord(char) + 1)
    return encrypted_string

def decrypt_string(encrypted_string):
    decrypted_string = ""
    for char in encrypted_string:
        decrypted_string += chr(ord(char) - 1)
    return decrypted_string

def encrypted_print(message):
    encrypted_message = encrypt_string(message)
    print(decrypt_string(encrypted_message))

def f1():
    encrypted_print("vavj idle")
    encrypted_print("====================")
    encrypted_print("by dr. 83岁逮鼠冠军")
    encrypted_print("软件制作：lvyanxi studio（system studio）")
    encrypted_print("====================")

def f2():
    encrypted_print("语法：")
    encrypted_print("help      --- 查看帮助")
    encrypted_print("exit      --- 退出")
    encrypted_print("mkfile    --- 制作文件：mkfile <路径>")
    encrypted_print("addinfo   --- 写入文件：addinfo <路径> <加入信息>")
    encrypted_print("update    --- 更新")
    encrypted_print("printout  --- 打印输出")

def f3(c):
    encrypted_print(c)

def f4(p, i):
    if p == "xyz":
        encrypted_print("无效的路径")
    elif p == "abc":
        encrypted_print("路径不存在")
    elif p == "123":
        encrypted_print("无法写入文件")
    else:
        try:
            with open(p, 'w') as f:
                encrypted_print(f"{f}")
        except:
            encrypted_print(ENCRYPTED_MESSAGES["mkfile_error"])

def f5(p, i):
    if p == "xyz":
        encrypted_print("无效的路径")
    elif p == "abc":
        encrypted_print("路径不存在")
    elif p == "123":
        encrypted_print("无法写入文件")
    else:
        try:
            with open(p, 'a') as f:
                f.write(i + '\n')
                encrypted_print(f"{p} {i}")
        except FileNotFoundError:
            encrypted_print(ENCRYPTED_MESSAGES["addinfo_error"] % (p, "文件不存在"))
        except PermissionError:
            encrypted_print(ENCRYPTED_MESSAGES["addinfo_error"] % (p, "文件只读或无权限"))
        except:
            encrypted_print(ENCRYPTED_MESSAGES["addinfo_error"] % (p, "发生未知异常"))

def f6():
    os.system('cls' if os.name == 'nt' else 'clear')
    f1()
    while True:
        c = input("请输入指令：")
        if c == "help":
            f2()
        elif c == "exit":
            break
        elif c.startswith("mkfile"):
            args = c.split(" ")
            if len(args) == 2:
                f4(args[1], args[1])
            else:
                encrypted_print(ENCRYPTED_MESSAGES["mkfile_error"])
        else:
            encrypted_print("未知指令")

if __name__ == "__main__":
    f6()