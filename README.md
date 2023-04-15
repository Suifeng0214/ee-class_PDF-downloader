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
There is no error handling mechanism.

## Input Explanation
URL example: "https://ncueeclass.ncu.edu.tw/sysdata/doc/e/xxxxxxxxxx/images"<br>
END: Download slides from ee-class for pages [1, END] and convert them to PDF.<br>
NAME: Generate NAME.pdf.
