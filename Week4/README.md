<b>Frame vs Bounds açıklayınız </b>

Frame: seçilen view’in superview’inin içerisindeki koordinat sistemine göre lokasyonunu ve boyutlarını belirtir.
Bounds: seçilen view’in kendi içerisindeki koordinat sistemine göre lokasyonunu ve boyutlarını belirtir.

Frame bir üst layerın koordinat sistemine göre hareket ederken bounds ise kendi içerisindeki kordinat sistemine göre hareket eder.

<b>UIViewController Yaşam Döngüsü</b>

ViewDidLoad: UIViewController’ın yaşam döngüsünde 1 kere çalıştırılır. <br>
ViewWillAppear : UIViewController görünmeden önce çağrılır. Ekran görünmeden bazı şeyleri gizlemek istersek kullanabiliriz.<br>
ViewDidAppear: UIViewController görüntülendikten hemen sonra çağrılır. <br>
ViewWillDisappear: Ekran kaybolmadan hemen önce çalışılır. Sayfalar arası geçişte yapılması gereken işlemler yapılabilir.<br>
ViewDidDisappear: Ekran kaybolduktan sonra bu fonksiyon çağrılır. Arka planda çalışmasını istediğimiz ve istemediğimiz işlemler için kullanılabilir.<br>
loadView: Eğer view’ı storyboard kullanarak oluşturmadıysak bu fonksiyonu kullanılabilir.

<b>Static keyword neden kullanırız. Örnek bir kullanım yapınız </b>

Static let kullanarak o sınıfın istediğimiz değerine direkt olarak erişebiliriz. Bunlar bir sınıfın tüm nesneleri arasında paylaşılır.

class Product {<br>
    static let type = “Atıştırmalık”<br>
    var price = 10.0<br>
}<br>

let obj = Product()<br>
obj.price // 10.0<br>
Product.type // "Atıştırmalık"
