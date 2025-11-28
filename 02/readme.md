## ✅ **2. nap – Többtáblás lekérdezések, relációk és JOIN-ok**

### 🔹 Téma: Kapcsolt táblák kezelése

#### A) **Relációs modell gyakorlati szinten**

* Normálformák (1, 2, 3NF)
* Táblák közti kapcsolatok (1:N, N:N)
* Külső kulcs (FOREIGN KEY)

#### B) **JOIN típusok használata**

A JOIN utasításokat két tábla, például A és B között az alábbiak szerint használhatjuk:


* `INNER JOIN` : Csak azokat a sorokat adja vissza, amelyek mindkét táblában megfelelnek a feltételnek.
* `LEFT (OUTER) JOIN` : Az A tábla összes sorát visszaadja, és a B táblából csak azokat, amelyek megfelelnek a feltételnek. Ha nincs egyezés, akkor NULL értékeket ad vissza a B oszlopaira.
* `RIGHT (OUTER) JOIN` : A B tábla összes sorát visszaadja, és az A táblából csak azokat, amelyek megfelelnek a feltételnek. Ha nincs egyezés, akkor NULL értékeket ad vissza az A oszlopaira.
* `FULL (OUTER) JOIN` : Az A és B táblák összes sorát visszaadja. Ha nincs egyezés, akkor NULL értékeket ad vissza a hiányzó oszlopokra.
* Több JOIN egy lekérdezésben
* Aliasing és olvashatóság javítása

#### C) **Komplexebb feladatok**

* Több tábla kombinálása
* Pl. tanulók jegyei, osztályok, tanárok, tantárgyak kapcsolása

#### Gyakorlat:
---
