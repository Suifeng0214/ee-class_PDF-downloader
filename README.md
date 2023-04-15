# ee-class_PDF-downloader
 An easy script to crawl the slides and merge them into pdf file<br>
（作者於WSL2中使用，由於WSL檔案共享之便利所以適用，最下方介紹相關 WSL2）
## Requirement
- Bash environment like Ubuntu, WSL...

### Command
```
sudo apt-get update
sudo apt-get install wget imagemagick ghostscript
```

## Usage
### Get URL for input
1. 打開要下載的 ee-class 上課教材簡報
2. 對投影片右鍵 "複製圖片位址" ![](https://i.imgur.com/hOqGZ2A.png)
3. 將其尾端去除，如下方 Input Explanation 的 URL example

### Run script
1. Run the script in a Bash environment.
2. Follow the prompts to input the URL, ending index, and name for the generated PDF file.
3. The script will download and convert the JPG files into PDF in batches.
4. The generated PDF file will be saved with the specified name **in the same directory as the script**.<br>

Note: Make sure you have the necessary dependencies (wget, imagemagick, and ghostscript) installed in your system before running the script.

## Becareful
This script will delete all .jpg .pdf files in the same directory as the script.<br>
There is no error handling mechanism.

## Input Explanation
URL example: "https://ncueeclass.ncu.edu.tw/sysdata/doc/e/xxxxxxxxxx/images"<br>
END: Download slides from ee-class for pages [1, END] and convert them to PDF.<br>
NAME: Generate NAME.pdf.

## About WSL2
詳細完整安裝教學: https://hackmd.io/@Koios/SycW9SreK#%E4%BD%BF%E7%94%A8-WSL2 <br>
在 WSL 中，您可以在 Windows 和 Linux 之間進行檔案共享。`\\wsl$` 路徑可以用來訪問 WSL 子系統的檔案系統，就像在本機 Windows 檔案系統中一樣。

例如，如果您在 WSL 中運行的 Ubuntu 子系統中有一個檔案 `/home/user/documents/file.txt`，您可以在 Windows 中使用 `\\wsl$\Ubuntu\home\user\documents\file.txt` 來訪問這個檔案，其中 Ubuntu 是您運行的 WSL 子系統的名稱。

需要注意的是，`\\wsl$` 只能在運行 Windows 10 以上版本的 WSL 2 中使用。
