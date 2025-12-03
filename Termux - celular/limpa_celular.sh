#!/bin/bash
# Script para apagar o conteúdo das pastas do Whatsapp Business do celular


rm -fv storage/shared/Android/media/com.whatsapp.w4b/WhatsApp\ Business/Media/WhatsApp\ Business\ Documents/*
rm -fv storage/shared/Android/media/com.whatsapp.w4b/WhatsApp\ Business/Media/WhatsApp\ Business\ Documents/Private/*
rm -fv storage/shared/Android/media/com.whatsapp.w4b/WhatsApp\ Business/Media/WhatsApp\ Business\ Documents/Sent/*



rm -fv storage/shared/Android/media/com.whatsapp.w4b/WhatsApp\ Business/Media/WhatsApp\ Business\ Audio/*
rm -fv storage/shared/Android/media/com.whatsapp.w4b/WhatsApp\ Business/Media/WhatsApp\ Business\ Audio/Private/*
rm -fv storage/shared/Android/media/com.whatsapp.w4b/WhatsApp\ Business/Media/WhatsApp\ Business\ Audio/Sent/*



rm -fv storage/shared/Android/media/com.whatsapp.w4b/WhatsApp\ Business/Media/WhatsApp\ Business\ Video/*
rm -fv storage/shared/Android/media/com.whatsapp.w4b/WhatsApp\ Business/Media/WhatsApp\ Business\ Video/Private/*
rm -fv storage/shared/Android/media/com.whatsapp.w4b/WhatsApp\ Business/Media/WhatsApp\ Business\ Video/Sent/*



rm -fv storage/shared/Android/media/com.whatsapp.w4b/WhatsApp\ Business/Media/WhatsApp\ Business\ Images/*
rm -fv storage/shared/Android/media/com.whatsapp.w4b/WhatsApp\ Business/Media/WhatsApp\ Business\ Images/Private/*
rm -fv storage/shared/Android/media/com.whatsapp.w4b/WhatsApp\ Business/Media/WhatsApp\ Business\ Images/Sent/*


# limpando conversas em audio:
rm -rfv storage/shared/Android/media/com.whatsapp.w4b/WhatsApp\ Business/Media/WhatsApp\ Business\ Voice\ Notes/*/*.opus

# limpando logs e tmps:
rm -rfv /data/data/com.termux/files/usr/var/log/*/*.log
rm -rfv /data/data/com.termux/files/usr/var/log/apt/*.log
rm -rfv /data/data/com.termux/files/usr/tmp/*.tmp




