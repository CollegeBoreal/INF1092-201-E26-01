# Nouveau fichier students.ps1
# Liste des étudiants avec IDS et AVATARS correspondants

$STUDENTS = @(
"300124366|rb0980h-dot|261495945"
"300147253|octocat|583231"
"300147891|amadbarry96|261496046"
"300151535|moudiraghilas-cmyk|262721627"
"300151722|islamoustani5-collab|261488966"
"300152004|danielmananga|218153814"
"300153405|rekaikkhaled|261492660"
"300153416|rouabahkhalil28-crypto|583231"
"300155045|chouaibait|232956639"
"300155462|zakariamamssi05|231498971"
"300156534|salhiwalid540-hue|261489191"
"300157250|jeanpi-erre01|261491627"
"300157298|octocat|583231"
"300157307|amaradjida7-hub|261494517"
"300157423|octocat|583231"
"300157606|ouahiba1994|261497731"
"300157733|albachiralmouhamad|261491303"
"300158085|kevinmayele-ai|258312358"
"300159180|abdenourzourane-cpu|261489848"
"300159195|islemtd3-hue|261489005"
"300159203|riadhsahraoui|261489597"
"300159437|bob19142005|203893881"
"300159463|hammahichem99|261489495"
"300159693|octocat|583231"
"300159672|1999amadou03-star|233241856"
"300159887|hammichebillal06-dot|261490027"
"300159995|nidalon52-glitch|261493465"
"300160006|maimouna247|261489041"
"300160424|youcef-1994|261502136"
"300160504|mmounir07|261492337"
"300160733|octocat|583231"
"300160862|cherifyamna|261494322"
)

# --------------------------------------
# Division des étudiants en 1 groupe
# --------------------------------------

$TOTAL = $STUDENTS.Count
$GROUP_SIZE = [Math]::Ceiling($TOTAL / 1)

$GROUP_1 = $STUDENTS[0..($GROUP_SIZE - 1)]
$GROUP_2 = $STUDENTS[($GROUP_SIZE)..($TOTAL - 1)]

# --------------------------------------
# Division des VMs en 2 groupes
# --------------------------------------

$SERVERS = @(
"10.7.237.224"
)

$SERVER_GROUP_1 = $SERVERS[0..($GROUP_SIZE - 1)]
$SERVER_GROUP_2 = $SERVERS[($GROUP_SIZE)..($TOTAL - 1)]

# --------------------------------------
# S21	https://10.7.237.19:8006	64	16	272	Virtual Environment 7.4-20
# S25	https://10.7.237.38:8006	64	16	272	Virtual Environment 7.4-20
# --------------------------------------

$PROXMOX_SERVERS = @(
"10.7.237.19"
"10.7.237.38"
)

$PROXMOX_GROUP_1 = $PROXMOX_SERVERS[0] 
$PROXMOX_GROUP_2 = $PROXMOX_SERVERS[1] 

# --------------------------------------
# pm_token_id     = "tofu@pve!opentofu"
# pm_token_secret = "4fa24fc3-bd8c-4916-ba6e-09xxxxxx3b00"
# --------------------------------------

$TOFU_SECRETS = @(
"f2097a3c-f9f0-4558-9a43-5cd0ae718abe"
"1cde2cfc-e100-47b9-9ee2-591ed83cfb8e"
)

$TOFU_SECRET_GROUP_1 = $TOFU_SECRETS[0] 
$TOFU_SECRET_GROUP_2 = $TOFU_SECRETS[1] 

$PK_PROF="b300098957@ramena"

## Cours Moodle
$LMS_COURSE=4
