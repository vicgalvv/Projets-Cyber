from scapy.all import ARP, Ether, srp


def scanner_reseau(reseau):
    """
    Scanne un réseau local et retourne les machines détectées.
    """

    # Création de la requête ARP
    arp = ARP(pdst=reseau)

    # Création de la trame Ethernet Broadcast
    ether = Ether(dst="ff:ff:ff:ff:ff:ff")

    # Combinaison Ethernet + ARP
    paquet = ether / arp

    # Envoi des paquets et récupération des réponses
    resultats = srp(
        paquet,
        timeout=2,
        verbose=False
    )[0]

    # Liste des machines trouvées
    machines = []

    # Traitement des réponses
    for _, reponse in resultats:
        machines.append({
            "ip": reponse.psrc,
            "mac": reponse.hwsrc
        })

    return machines


# Point d'entrée du programme
if __name__ == "__main__":

   
    reseau = "10.100.200.93/24"

    print("Scan en cours...\n")

    machines = scanner_reseau(reseau)

    print(f"{len(machines)} machine(s) détectée(s)\n")

    print("-" * 40)
    print(f"{'Adresse IP':<16} {'Adresse MAC'}")
    print("-" * 40)

    for machine in machines:
        print(f"{machine['ip']:<16} {machine['mac']}")
