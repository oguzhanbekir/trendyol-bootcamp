<h3><b>Clipto ve Maskto bound nedir? </b></h3>

<b>clipsToBounds :</b> Çerçeve Bir görünüm frame (CGRect) dikdörtgeninin konumudur superviewkoordinat sistemi. Varsayılan olarak sol üstte başlar. clipsToBounds öğesi YES olarak ayarlandığında, alt görüntünün yalnızca superview sınırlarına uyan kısmını göreceğiz. Aksi takdirde, clipsToBounds öğesi HAYIR olarak ayarlanırsa, tüm alt görünümü, gözetim görünümünün dışındaki kısımları göreceğiz

<b>masks To Bounds :</b> Sınırlar Bir görünüm bounds (CGRect) kendi koordinat sisteminde bir görünüm dikdörtgenini ifade eder. masksToBounds özelliği YES olarak ayarlanırsa, katmanın sınırlarının dışına uzanan tüm alt katmanları bu sınırlara kırpılır. Bu durumda katmanı, alt katmanlarına açılan bir pencere olarak düşünelim; pencerenin kenarları dışındaki hiçbir şey görünmeyecektir. MasksToBounds HAYIR olduğunda, hiçbir kırpma oluşmaz ve katmanın sınırlarının dışına uzanan alt katmanlar bütünüyle görünür olacaktır (maskeleme etkinleştirilmiş herhangi bir süper katmanın kenarlarının dışına çıkmadıkları sürece).