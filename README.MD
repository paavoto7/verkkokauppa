Projekti käyttää kirjastoa tabulate sen helppouden vuoksi

Jos tietokanta puuttuu, voi ensimmäisellä kerralla ajaa create_db.py tiedoston, joka luo tietokannan.

Ohjelma suoritetaan ajamalla verkkokauppa.py tiedosto

Ohjelma kykenee löytämään tiedon verkkokaupan tuotteista, asiakkaista, tilauksista asiakasta kohden, 
kaikista yhteistilauksista ja kaikista sisäisistä tilauksista
Ohjelma pystyy myös luomaan yhteenvedon asiakkaiden, tilausten ja tuotteiden kokonaismääristä.

Verraten harjoitustyön suunnitelmaan, muutin ”TEKEE” taulun ”YHTEISTILAUS” tauluksi. Yksittäisen tilauksen asiakasnumero tallennetaan tilaukseen. 
Jos tilaus on kuitenkin yhteistilaus, tallennetaan tilaukseen ”Asiakas_ID” attribuuttiin sen asiakkaan ID, jonka käyttäjältä tilaus tehtiin.