from tabulate import tabulate

from db_conn import Database


def select_customers():
    with Database("verkkokauppa.db") as db:
        customers = db.query("SELECT * FROM asiakas;")
        return customers


def select_order(asiakasnro=None):
    order_list = []
    order_list.extend(select_orders("SELECT tilausnro, sisainen, tila, hinta FROM tilaus WHERE asiakasnro = ?;", asiakasnro))

    order_list.extend(select_orders("SELECT t.tilausnro, t.sisainen, t.tila, t.hinta FROM tilaus t JOIN yhteistilaus y ON "
                      "t.tilausnro = y.tilausnro WHERE y.asiakasnro = ? AND y.asiakasnro <> t.asiakasnro;", asiakasnro))

    return order_list


def select_orders(sql, params=None):

    with Database("verkkokauppa.db") as db:
        orders = db.query(sql, params)
        tables = []

        if len(orders) == 0:
            return []

        for order in orders:
            order_list = [list(order)]
            order_rows = db.query("SELECT rivinro, maara, tuotenro FROM tilausrivi WHERE tilausnro = ?", str(order[0]))
            order_list.append(["Rivinro", "Määrä", "Tuotenro"])
            for row in order_rows:
                order_list.append(row)
            tables.append(tabulate(order_list, headers=["Tilausnro", "Sisainen", "Tila", "Hinta"], tablefmt="simple_outline"))

    return tables


def select_multi_orders(choice):
    if choice == "3":
        orders = select_orders("SELECT DISTINCT t.tilausnro, sisainen, tila, hinta FROM tilaus t "
                               "JOIN yhteistilaus y ON t.tilausnro = y.tilausnro;")
    else:
        orders = select_orders("SELECT DISTINCT tilausnro, sisainen, tila, hinta FROM tilaus WHERE sisainen = 'Kyllä'")

    return orders


def select_products():
    with Database("verkkokauppa.db") as db:
        products = db.query("SELECT * FROM tuote;")
        return products


def summary():
    with Database("verkkokauppa.db") as db:
        tables = ["asiakas", "tilaus", "tuote"]
        result = []

        for table in tables:
            result.extend(db.query(f"SELECT COUNT(*) FROM {table}")[0])

        return [result]

