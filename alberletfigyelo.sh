cd /root/
rm uj_albi.csv
cat alberletek_uj.csv > alberletek_regi.csv

curl http://www.alberlet.hu/kiado_alberlet/berleti-dij:0-110-ezer-ft/emelet:7+8+9+10+11+12+13+14+15+16/ingatlan-tipus:lakas/keppel:igen/kerulet:ii+v+vi+vii+\
viii+ix+xi+xiii/keruletresz:2560_gellerthegy+15799_infopark+15622_lagymanyos-muegyetem-kornyeke+15660_ujlipotvaros+15834_ujlipotvaros-cezarhaz+15835_ujlipotvaros-\
kleopatrahaz+15836_ujlipotvaros-romaikert+15661_ujlipotvarosi-lakotelep+15581_belso-erzsebetvaros+15586_belso-ferencvaros+15579_belso-terezvaros+15577_belvaros+15578_lipotva\
ros+15514_orszagut+37_vizivaros+15798_jozsefva\
ros-corvinnegyed/kiveve-a-foldszint:igen/megye:budapest/meret:40-x-m2/szoba:1-x/view:list/keres:advanced/limit:32/sort:reactivated/direction:desc |grep v4_hirdetes_lis\
tanezet_uj_ablakban | sed -e 's/^[ \t]*//' \
|sed 's/^.*href="http:\/\/www.alberlet.hu//g' |sed 's/^.*href="//g' |sed 's/".*$//g' |sed 's/\/kiado/http:\/\/www.alberlet.hu\/kiado/g' > alberletek_uj.csv

sort alberletek_uj.csv >1.csv
sort alberletek_regi.csv >2.csv

comm <(sort alberletek_uj.csv) <(sort alberletek_regi.csv) -23 > uj_albi.csv

if [ -s uj_albi.csv ]
 then mutt -s "Alberlet Figyelo" @gmail.com <uj_albi.csv
mutt -s "Alberlet Figyelo" @gmail.com <uj_albi.csv
# else mutt -s "Alberlet Figyelo" mestitomi@gmail.com <mukodik.csv
fi