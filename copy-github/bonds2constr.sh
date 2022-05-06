# Takes in an .itp file and replaces all
# bonds with force constants of 30'000 with contraints
#
# usage:
# ./bonds2constr.sh <in.itp> <out.itp>

cp $1 .tmptop.top
printf '\n[ constraints ]\n' >> .tmptop.top
grep '30000' $1 > .tmppostconstr.top
sed '/30000/d' -i .tmptop.top
cat .tmppostconstr.top >> .tmptop.top
rm .tmppostconstr.top
mv .tmptop.top $2
