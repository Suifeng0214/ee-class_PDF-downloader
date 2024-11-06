# eeclass pdf download script by Suifeng0214.

echo "Input 說明"
echo "URL example: \"https://ncueeclass.ncu.edu.tw/sysdata/doc/e/xxxxxxxxxx/images\""
echo "END: 下載 ee-class 上 [1, END] 頁的簡報並轉換成 PDF"
echo "NAME: 將生成 NAME.pdf"
echo "QUALITY: 壓縮程度（1-100），100 表示不壓縮"

read -p "請輸入網址 URL: " URL
read -p "請輸入結束編號 END: " END
read -p "請為將生成之 PDF 命名: " NAME
read -p "請輸入壓縮程度（1-100）: " QUALITY
BATCH_SIZE=10 # 默認的批次大小，建議 <87

if ! [[ "$QUALITY" =~ ^[0-9]+$ ]] || [ "$QUALITY" -lt 1 ] || [ "$QUALITY" -gt 100 ]; then
    echo "壓縮程度必須是 1 到 100 之間的整數。"
    exit 1
fi

# 計算批次數量
BATCH_COUNT=$(( $END / $BATCH_SIZE ))

# 下載 jpg 檔案並轉換成 PDF
for (( i=0; i<=BATCH_COUNT; i++ )); do
    START_IDX=$(( i * BATCH_SIZE + 1 ))
    END_IDX=$(( START_IDX + BATCH_SIZE - 1 ))
    if (( END_IDX > END )); then
        END_IDX=$END
    fi
    echo "正在下載並轉換第 $START_IDX 到 $END_IDX 張圖片..."

    for (( j=START_IDX; j<=END_IDX; j++ )); do
        url="${URL}/${j}.jpg"
		wget -q $url
    done

    if [ "$QUALITY" -eq 100 ]; then
        img2pdf $(seq -f "%g.jpg" $START_IDX $END_IDX) -o "${i}.pdf"
    else
        convert -quiet -quality "$QUALITY" $(seq -f "%g.jpg" $START_IDX $END_IDX) "${i}.pdf"
    fi
	
    rm $(seq -f "%g.jpg" $START_IDX $END_IDX)
done

# 合併生成的 PDF 檔案
echo "下載並轉換完成，正在合併生成的 pdf 檔案..."
mkdir output
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=output/${NAME}.pdf $(seq -f "%g.pdf" 0 $BATCH_COUNT)
rm *.pdf
mv ./output/* .
rmdir output
echo "合併完成，生成的 pdf 檔案為 $NAME.pdf。"