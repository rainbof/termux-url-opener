# Termux URL Opener
Toto je wrapper který zpracovává akce předané termuxu přes "sdílet" pokud se něco sdílí do termuxu tak tento skript to zachytí a provede nad tím akce. Převážně stahování obsahu pro offline poslech. Motivace je hlavně v tom že offline přehrávání šetří data a baterii.

Automaticky zpracovává adresy URL. Umožňuje stahovat videa a audio z YouTube, rozhlasu a dalších zdrojů přímo do vašeho zařízení.
Takovej otevírák na streamy. Rovnou rikam ze je to krehke a dost zbastlene. Psal jsem to primo na mobilu :)

original repozitar: git@github.com:rainbof/termux-url-opener.git


## Instalace

1. Zkopírujte skript do Termux bin adresáře:
```bash
cp termux-url-opener $PREFIX/bin/termux-url-opener
chmod +x $PREFIX/bin/termux-url-opener
```

2. Nainstalujte závislosti:
```bash
pkg install yt-dlp
```

3. V Termux nastavte aplikaci jako výchozí handler pro URLs:
   - Jděte do **Nastavení > Aplikace > Výchozí aplikace > Otevírání odkazů**
   - Vyberte Termux

## Konfigurace

Upravte cestu pro stahování v skriptu:
```bash
download_yt_dir="/storage/emulated/0/Movies/yt-downloader"
```

### Přidání nového zdroje

V poli `url_action` přidejte mapování domény na funkci:
```bash
declare -A url_action=(
    ["youtube.com"]="yt-downloader"
    ["vaswesitka.cz"]="moje-funkce"
)
```

Poté definujte příslušnou funkci:
```bash
moje-funkce() {
    local url="${1:-}"
    # vaša logika
}
```

## Použití

Skript se automaticky spouští při kliknutí na URL v Termux. Ruční spuštění:
```bash
termux-url-opener "https://www.youtube.com/watch?v=..."
termux-url-opener "/storage/emulated/0/file.txt"
```

## Podporované zdroje

| Doména | Akce |
|--------|------|
| `youtube.com`, `youtu.be`, `m.youtube.com` | Stažení videa jako MP3 |
| `dvojka.rozhlas.cz`, `mujrozhlas.cz` | Stažení audita (respektuje playlists) |

## Požadavky

- Termux
- `yt-dlp` – pro stahování médií
- Bash 4+

## Vlastnosti

- ✅ Automatické routování URL na základě domény
- ✅ Detekce typu vstupu (URL vs. místní soubor)
- ✅ Přepis domén (www., schéma)
- ✅ Podpora čistého audio (MP3)
- ✅ Rozšiřitelná architektura

## Licence

Volně šiřitelné.
