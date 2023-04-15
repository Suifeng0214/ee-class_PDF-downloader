# ee-class_PDF-downloader
 An easy script to crawl the slides and merge them into pdf file

## Requirement
```
sudo apt-get update
sudo apt-get install wget imagemagick ghostscript
```

## Usage
1. Run the script in a Bash environment.
2. Follow the prompts to input the URL, ending index, and name for the generated PDF file.
3. The script will download and convert the JPG files into PDF in batches.
4. The generated PDF file will be saved with the specified name **in the same directory as the script**.
Note: Make sure you have the necessary dependencies (wget, imagemagick, and Ghostscript) installed in your system before running the script.

## Becareful
This script will delete all .jpg .pdf files in the same directory as the script.

## Input Explanation
URL example: "https://ncueeclass.ncu.edu.tw/sysdata/doc/e/xxxxxxxxxx/images"<br>
END: 下載 ee-class 上 [1, END] 頁的簡報並轉換成 pdf<br>
NAME: 將生成 NAME.pdf 
