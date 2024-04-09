
class Achatdetail {
  int codevente;
  int codeproduit;
  int quantite;
  double prixu;

  Achatdetail({required this.codeproduit, required this.quantite,required this.codevente, required this.prixu});

  Map<String, dynamic> toJson() {
    return {
      'vente_id': codevente,
      'produit_id': codeproduit,
      'quantite': quantite,
      'prixu': prixu,
    };
  }
}