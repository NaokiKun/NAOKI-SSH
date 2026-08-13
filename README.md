# NAOKI SSH

**English / မြန်မာ**

NAOKI SSH is a Debian/Ubuntu VPS management panel for SSH, OpenVPN, Dropbear, Squid, SSL tunnel, WebSocket, BadVPN, and related services. It provides an interactive `menu` command for account and service management.

NAOKI SSH သည် Debian/Ubuntu VPS ပေါ်တွင် SSH၊ OpenVPN၊ Dropbear၊ Squid၊ SSL Tunnel၊ WebSocket၊ BadVPN နှင့် ဆက်စပ် service များကို စီမံရန် အသုံးပြုနိုင်သော VPS management panel ဖြစ်သည်။ Install ပြီးနောက် `menu` command ဖြင့် user နှင့် service များကို စီမံနိုင်သည်။

## Supported languages / အသုံးပြုနိုင်သော ဘာသာစကားများ

The installer and main management menu support **English** and **Myanmar**. The language is selected during installation and can be changed from the main menu with **`L`**. The selection is stored in `/etc/naoki-ssh-language`.

Installer နှင့် အဓိက management menu တွင် **English** နှင့် **Myanmar** နှစ်မျိုး အသုံးပြုနိုင်သည်။ Install ပြုလုပ်ချိန်တွင် ဘာသာစကားရွေးချယ်နိုင်ပြီး main menu ထဲမှ **`L`** ကိုနှိပ်၍ ပြန်ပြောင်းနိုင်သည်။ ရွေးချယ်ထားသော language ကို `/etc/naoki-ssh-language` တွင် သိမ်းထားသည်။

## Installation / ထည့်သွင်းခြင်း

Review the scripts before running them on a production VPS. The installer requires root access and changes system packages, SSH configuration, firewall rules, cron jobs, and services.

Production VPS ပေါ်တွင် မသုံးမီ source code ကို စစ်ဆေးပါ။ Installer သည် root access လိုအပ်ပြီး package များ၊ SSH configuration၊ firewall rules၊ cron jobs နှင့် services များကို ပြောင်းလဲနိုင်သည်။

```bash
apt install wget -y
bash <(wget -qO- https://raw.githubusercontent.com/NaokiKun/NAOKI-SSH/main/ssh-plus)
```

After installation, use:

```bash
menu
```

## Notes / မှတ်ချက်

This project is a work in progress. Service-specific legacy modules may still contain their original English/Portuguese prompts while the core installer, main menu, branding, and account workflow are being localized.

ဤ project သည် development ဆက်လုပ်နေဆဲဖြစ်သည်။ Core installer၊ main menu၊ branding နှင့် account workflow များကို ဘာသာပြန်ထားသော်လည်း service-specific legacy module အချို့တွင် မူရင်း English/Portuguese prompt များ ကျန်ရှိနိုင်သည်။
