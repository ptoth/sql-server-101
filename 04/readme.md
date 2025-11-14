## ✅ **4. nap – Kurzorok + projektfeladat**

### 🔹 Téma: Soronkénti adatfeldolgozás és komplex adatkezelés

#### A) **Kurzorok használata**

* Mikor van rájuk szükség?
* Szerkezete:

  ```sql
  DECLARE cursor_name CURSOR FOR ...
  OPEN cursor_name
  FETCH NEXT FROM ...
  WHILE @@FETCH_STATUS = 0
  BEGIN
      -- logika
      FETCH NEXT ...
  END
  CLOSE cursor_name
  DEALLOCATE cursor_name
  ```

#### B) **Gyakorlati példa**

* Minden tanuló jegyeinek átnézése, ha bukott → külön táblába helyezés
* Kurzor + tárolt eljárás kombinálása


---