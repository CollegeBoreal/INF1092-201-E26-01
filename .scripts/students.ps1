# Nouveau fichier students.ps1
# Liste des étudiants avec IDS et AVATARS correspondants

$STUDENTS = @(
"300124366|rb0980h-dot|261495945"
"300147253|octocat|583231"
"300147891|amadbarry96|261496046"
"300150396|ibkourouma|232939321"
"300151722|islamoustani5-collab|261488966"
"300152004|danielmananga|218153814"
"300153405|rekaikkhaled|261492660"
"300153416|rouabahkhalil28-crypto|583231"
"300155045|chouaibait|232956639"
"300155462|zakariamamssi05|231498971"
"300156534|salhiwalid540-hue|261489191"
"300157250|jeanpi-erre01|261491627"
"300157298|amar20101999|288085455"
"300157307|amaradjida7-hub|261494517"
"300157423|gaya-994|261497291"
"300157606|ouahiba1994|261497731"
"300157727|rayan23082001|583231"
"300157733|albachiralmouhamad|261491303"
"300158085|kevinmayele-ai|258312358"
"300159180|abdenourzourane-cpu|261489848"
"300159195|islemtd3-hue|261489005"
"300159203|riadhsahraoui|261489597"
"300159437|bob19142005|203893881"
"300159463|hammahichem99|261489495"
"300159693|mazigh-2000|288084942"
"300159672|1999amadou03-star|233241856"
"300159887|hammichebillal06-dot|261490027"
"300159995|nidalon52-glitch|261493465"
"300160006|maimouna247|261489041"
"300160424|youcef-1994|261502136"
"300160504|mmounir07|261492337"
"300160733|belhadiyanis200-a11y|261489188"
"300160862|cherifyamna|261494322"
)

# --------------------------------------
# Division des étudiants en 3 groupes
# --------------------------------------

$TOTAL = $STUDENTS.Count
$GROUP_SIZE = [Math]::Ceiling($TOTAL / 4)

$TOTAL = $STUDENTS.Count
$GROUP_SIZE = [Math]::Ceiling($TOTAL / 4)

$GROUP_1 = $STUDENTS[0..($GROUP_SIZE - 1)]
$GROUP_2 = $STUDENTS[$GROUP_SIZE..(2 * $GROUP_SIZE - 1)]
$GROUP_3 = $STUDENTS[(2 * $GROUP_SIZE)..(3 * $GROUP_SIZE - 1)]
$GROUP_4 = $STUDENTS[(3 * $GROUP_SIZE)..($TOTAL - 1)]

# --------------------------------------
# Division des VMs en 3 groupes
# --------------------------------------

$SERVERS = @(
"10.7.237.194"
"10.7.237.195"
"10.7.237.196"
"10.7.237.197"
"10.7.237.198"
"10.7.237.199"
"10.7.237.200"
"10.7.237.201"
"10.7.237.202"
"10.7.237.203"
"10.7.237.204"
"10.7.237.205"
"10.7.237.206"
"10.7.237.207"
"10.7.237.208"
"10.7.237.209"
"10.7.237.210"
"10.7.237.211"
"10.7.237.212"
"10.7.237.213"
"10.7.237.214"
"10.7.237.215"
"10.7.237.216"
"10.7.237.217"
"10.7.237.218"
"10.7.237.219"
"10.7.237.220"
"10.7.237.221"
"10.7.237.222"
"10.7.237.223"
"10.7.237.224"
"10.7.237.225"
"10.7.237.226"
"10.7.237.227"
)

$SERVER_GROUP_1 = $SERVERS[0..($GROUP_SIZE - 1)]
$SERVER_GROUP_2 = $SERVERS[$GROUP_SIZE..(2 * $GROUP_SIZE - 1)]
$SERVER_GROUP_3 = $SERVERS[(2 * $GROUP_SIZE)..(3 * $GROUP_SIZE - 1)]
$SERVER_GROUP_4 = $SERVERS[(3 * $GROUP_SIZE)..($TOTAL - 1)]

# --------------------------------------
# | 2    | 28       | HP Proliant DL360 G6️⃣ | S25       | 10.7.237.24             | 56       | 16  | 272     | —                              | —                                                        |
# | 2    | 27       | HP Proliant DL360 G7️⃣ | S26       | 10.7.237.40             | 48       | 16  | 272     | —                              | —                                                        |
# | 2    | 26       | HP Proliant DL360 G6️⃣ | S27       | 10.7.237.34             | 44       | 16  | 272     | —                              | —                                                        |
# | 2    | 25       | HP Proliant DL360 G7️⃣ | S28       | 10.7.237.11             | 64       | 16  | 273     | —                              
# --------------------------------------

$PROXMOX_SERVERS = @(
"10.7.237.19"
"10.7.237.24"
"10.7.237.28"
"10.7.237.11"
)

$PROXMOX_GROUP_1 = $PROXMOX_SERVERS[0] 
$PROXMOX_GROUP_2 = $PROXMOX_SERVERS[1] 
$PROXMOX_GROUP_3 = $PROXMOX_SERVERS[2] 
$PROXMOX_GROUP_4 = $PROXMOX_SERVERS[3] 

# --------------------------------------
# pm_token_id     = "tofu@pve!opentofu"
# pm_token_secret = "4fa24fc3-bd8c-4916-ba6e-09a8aecc3b00"
# 2 = "f728d095-1506-490f-81b1-ecdafdfb8ef9"
# --------------------------------------

$TOFU_SECRETS = @(
"4fa24fc3-bd8c-4916-ba6e-09a8aecc3b00"
"55dccf39-a3db-4bad-8a28-954addb13739"
"63cd5a0b-24a0-42a1-9ce3-993a2d9de8dd"
"63cd5a0b-24a0-42a1-9ce3-993a2d9de8dd"
)

$TOFU_SECRET_GROUP_1 = $TOFU_SECRETS[0] 
$TOFU_SECRET_GROUP_2 = $TOFU_SECRETS[1] 
$TOFU_SECRET_GROUP_3 = $TOFU_SECRETS[2] 
$TOFU_SECRET_GROUP_4 = $TOFU_SECRETS[3] 

$PK_PROF="b300098957@ramena"

# https://${env:LMS_URL}/course/view.php?id=3
$LMS_COURSE=3
