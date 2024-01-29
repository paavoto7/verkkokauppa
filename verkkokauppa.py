import sys

try:
    from tabulate import tabulate
except ModuleNotFoundError:
    sys.exit("Kirjasto 'tabulate' puuttuu\nSuorita komento: pip install tabulate")

from query_funcs import select_order, select_customers, select_products, summary, select_multi_orders


def main():
    while True:
        try:
            action = input("1. Listaa asiakkaat\n2. Hae tilaus\n3. Listaa yhteistilaukset\n4. listaa sisäiset tilaukset"
                           "\n5. Listaa tuotteet\n6. Yhteenveto\n0. poistu\nValinta: ").strip()

            if action == "1":
                customers = select_customers()
                print(
                    tabulate(customers, headers=["ID", "Nimi", "Email", "Puhnro", "Osoite"], tablefmt="mixed_outline"))

            elif action == "2":
                asiakasnro = input("Asiakasnumero: ")
                orders = select_order(asiakasnro)
                print(*orders, sep="\n")

            elif action == "3":
                orders = select_multi_orders(action)
                print(*orders, sep="\n")

            elif action == "4":
                orders = select_multi_orders(action)
                print(*orders, sep="\n")

            elif action == "5":
                products = select_products()
                print(tabulate(products, headers=["Tuotenro", "Nimi", "Hinta", "Määrä", "Tyyppi"],
                               tablefmt="mixed_outline"))

            elif action == "6":
                print(tabulate(summary(), headers=["Asiakkaat", "Tilaukset", "Tuotteet"], tablefmt="mixed_outline"))

            elif action == "0":
                sys.exit(0)

            else:
                print("Syötä validi arvo")
                continue

        except (KeyboardInterrupt, EOFError):
            sys.exit(0)


if __name__ == "__main__":
    main()
