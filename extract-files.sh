#/bin/sh

VENDOR=acer
DEVICE=a500

OUTD=../../../vendor/$VENDOR/$DEVICE
PROPD=$OUTD/proprietary

[ ! -d $OUTD ] && mkdir -p $OUTD || rm -rf $OUTD/*

while read file; do
    dir=$PROPD/$(dirname $file)
    [ ! -d $dir ] && mkdir -p $dir
    if [[ -f "${WORKSPACE}/${DEVICE}.tar.bz2" ]]; then
        tar jxvf ${WORKSPACE}/${DEVICE}.tar.bz2 -C $PROPD $FILE
    else
        adb pull /system/$file $PROPD/$file
    fi
done < proprietary-files.txt

./setup-makefiles.sh
