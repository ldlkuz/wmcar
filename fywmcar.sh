#!/data/data/com.termux/files/usr/bin/bash
skip=50
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/data/data/com.termux/files/usr/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�!!�dfywmcar.sh �S�OA��_�\�aw-��Ĩ11j<���ݰ���̊�4ie$BD� T,i1�(�af�'���V?���7���v��#�HF����v�P{Q��J���ح��j;!>�E�r����L���i抢Q�����7h�y��/��C#
�,�ŧV���[��Bsq��`����X���ٹӓ����'�_f������OtQ<���[�aۋlr��qȎ���Qm��&�ꁪc���l�B#��F��4���xq��Xq�͵X���,�k��Y���c�VZ�#=#��&NB�R�\7�����Ot8H��rҙ ����c��P��1d��p�?�s��3Ӕ�<j7�S��E�nm�ַ⍦!�LD1h�00 q"�#��Q� �=☾k�u]�t<�d&���ퟣ����-Gvb�-3���;%Q��ȟ��q��N����X�S�vQ{Ԟ�p"1�'��+W�k	�t�c9Yl�/-��[)��iv�CT���&��3�|�sR�����*�#!Ѓ��%���N�P�12A�@���`����-5���X5���������|u�/�؜|������V�%�7竢^���K*��q�d~���ݾH�$8�+  