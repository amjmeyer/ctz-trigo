#!/bin/bash
# Refait la partie « Examples » du README à partir des fichiers
# exemples/NN-*.typ : un titre par fichier (sa ligne « = … »), une image par
# dessin (images/), son code s'affiche en cliquant dessus. À relancer après
# avoir modifié un exemple ou le rendu :
#
#   exemples/readme.sh
#
# Un dessin = un appel sur plusieurs lignes, en début de ligne, dont la
# première ligne finit par « ( », « [ » ou « { », fermé par « ) », « ] » ou
# « }) » seul sur sa ligne. `cetz` est importé pour les dessins dans un canvas.

cd "$(dirname "$0")/.."

# Compilateur : `typst` s'il est installé, sinon celui de l'extension Tinymist de VSCodium.
if command -v typst > /dev/null; then
  export TYPST=typst
else
  export TYPST=$(ls -d ~/.var/app/com.vscodium.codium/data/codium/extensions/myriad-dreamin.tinymist-*/out/tinymist | tail -1)
  export TYPST_PACKAGE_CACHE_PATH=~/.var/app/com.vscodium.codium/cache/typst/packages
fi

rm -rf images
mkdir -p images

python3 - <<'PY'
import glob, os, re, subprocess

entete = '''#import "/src/lib.typ": *
#import "/src/deps.typ": cetz
#set page(width: auto, height: auto, margin: 6pt, fill: white)
'''

def dessins(texte):
    blocs, courant = [], None
    for ligne in texte.splitlines():
        if courant is None:
            if re.match(r"#[a-z]", ligne) and ligne.rstrip()[-1:] in "([{":
                courant = [ligne]
        else:
            courant.append(ligne)
            if ligne in (")", "]", "})"):
                blocs.append("\n".join(courant))
                courant = None
    return blocs

lignes = []
fichiers = sorted(glob.glob("exemples/[0-9][0-9]-*.typ"))
for numero, fichier in enumerate(fichiers, 1):
    texte = open(fichier).read()
    titre = re.search(r"^= (.*)$", texte, re.M)
    lignes += ["", "### %d. %s" % (numero, titre.group(1) if titre else fichier)]
    for k, code in enumerate(dessins(texte), 1):
        image = "images/%02d-%02d.svg" % (numero, k)
        subprocess.run([os.environ["TYPST"], "compile", "--root", ".", "--format", "svg", "-", image],
                       input=entete + code, text=True, check=True)
        lignes += ["", "<details>",
                   '<summary><img src="%s" alt="exemple %d.%d"></summary>' % (image, numero, k),
                   "", "```typ", code, "```", "", "</details>"]

# remplace ce qui est entre les deux repères du README
readme = open("README.md").read()
debut = readme.index("-->", readme.index("<!-- exemples")) + 3
fin = readme.index("<!-- fin des exemples -->")
open("README.md", "w").write(readme[:debut] + "\n".join(lignes) + "\n" + readme[fin:])
PY
echo "README.md : $(ls images | wc -l) dessin(s)"
