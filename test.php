<!DOCTYPE html>
<html lang="hu">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Termékek</title>
<style>
    .product {
        position: relative; /* Relatív pozícionálás a szöveg elhelyezéséhez */
        width: 300px; /* Opcionális: A doboz szélességének beállítása */
        height: 200px; /* Opcionális: A doboz magasságának beállítása */
        margin: 20px; /* Opcionális: A térköz a dobozok között */
        overflow: hidden; /* Az overflow beállítása elrejti a szöveget, ha túl nagy */
        border-radius: 10px; /* Opcionális: kerekített sarkok hozzáadása */
    }

    .product img {
        width: 100%; /* A kép teljes szélességre való kiterjesztése */
        height: auto; /* Automatikus magasság beállítása a képarány megtartásához */
        position: absolute; /* Abszolút pozícionálás a háttérkép elhelyezéséhez */
        top: 0; /* A kép elhelyezése a doboz tetején */
        left: 0; /* A kép elhelyezése a doboz bal szélén */
        z-index: -1; /* A háttérkép rétegezési szintjének beállítása a szöveg mögött */
    }

    .product .content {
        position: relative; /* Relatív pozícionálás a szöveg elhelyezéséhez */
        z-index: 1; /* A szöveg rétegezési szintjének beállítása a háttérkép előtt */
        padding: 20px; /* Opcionális: térköz a szöveg és a doboz szélei között */
        color: white; /* Opcionális: a szöveg színének beállítása */
    }
</style>
</head>
<body>

<div class="container">
    <div class="product">
        <img src="hatterkep.jpg" alt="Háttérkép">
        <div class="content">
            <h2>Macska cicakaparó</h2>
            <p>Tartós és strapabíró cicakaparó macskáknak, amely segít megelőzni a karmolászást a bútorokon és a falakon.</p>
            <p>Ár: 2500 Ft</p>
            <a href="#" class="btn">Kosárba</a>
        </div>
    </div>
</div>

</body>
</html>
