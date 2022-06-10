" ==================
" === Vifm Files ===
" ==================

" pdf documents
filetype {*.pdf},<Application/pdf>
    \ {Open in Preview}
    \ open -a Preview.app,
    \ {Open in Skim}
    \ open -a Skim.app,
fileviewer {*.pdf},<Application/pdf> pdftotext -nopgbrk %c -

" music files
filetype {*.wav,*.mp3,*.flac,*.m4a,*.wma,*.ape,*.ac3,*.og[agx],*.spx,*.opus},
    \ <Audio/*>
    \ {Play using MPlayerX}
    \ open -a MPlayerX.app,
    \ {Open in iTunes}
    \ open -a iTunes.app,
    \ {Open in QuickTime Player}
    \ open -a QuickTime\ Player.app,
fileviewer *.mp3 mp3info
fileviewer *.flac soxi

" misc music files
filetype {*.avi,*.mp4,*.wmv,*.dat,*.3gp,*.ogv,*.mkv,*.mpg,*.mpeg,*.vob,
    \ *.fl[icv],*.m2v,*.mov,*.webm,*.ts,*.mts,*.m4v,*.r[am],*.qt,*.divx,
    \ *.as[fx]},
    \ <video/*>
    \ {Open in VLC}
    \ open -a VLC.app,
    \ {Open in QuickTime Player}
    \ open -a QuickTime\ Player.app,
    \ {Open in MPlayerX}
    \ open -a MPlayerX.app,
fileviewer {*.avi,*.mp4,*.wmv,*.dat,*.3gp,*.ogv,*.mkv,*.mpg,*.mpeg,*.vob,
    \ *.fl[icv],*.m2v,*.mov,*.webm,*.ts,*.mts,*.m4v,*.r[am],*.qt,*.divx,
    \ *.as[fx]},
    \ <video/*>
    \ ffprobe -pretty %c 2>&1

" html files
filetype {*.html,*.htm},<text/html>
    \ {Open in Safari}
    \ open -a Safari.app,
    \ {Open in Firefox}
    \ open -a Firefox.app,
    \ {Open in Chrome}
    \ open -a Google\ Chrome.app,
    \ {Open in vim}
    \ vim,
fileviewer {*.html,*.htm},<text/html> w3m -dump -T text/html

" images
filetype {*.bmp,*.jpg,*.jpeg,*.png,*.gif,*.xpm},<image/*>
    \ open -a Preview.app,
fileviewer {*.bmp,*.jpg,*.jpeg,*.png,*.gif,*.xpm},<image/*>
    \ identify %f

" md5 hash sum
filetype *.md5
    \ {Check MD5 hash sum}
    \ md5sum -c %f %S,

" sha1 hash sum
filetype *.sha1
    \ {Check SHA1 hash sum}
    \ sha1sum -c %f %S,

" sha256 hash sum
filetype *.sha256
    \ {Check SHA256 hash sum}
    \ sha256sum -c %f %S,

" sha512 hash sum
filetype *.sha512
    \ {Check SHA512 hash sum}
    \ sha512sum -c %f %S,

" archives
filetype {*.zip},<Application/zip,application/java-archive> unzip %f
fileviewer {*.zip,*.jar,*.war,*.ear},
    \ <Application/zip,application/java-archive>
    \ zip -sf %c

filetype {*.tar,*.tar.bz2,*.tbz2,*.tgz,*.tar.gz,*.tar.xz,*.txz,*.tar.zst,*.tzst},
    \ <Application/x-tar>
    \ tar -xf %f
fileviewer {*.tar,*.tar.bz2,*.tbz2,*.tgz,*.tar.gz,*.tar.xz,*.txz,*.tar.zst,*.tzst},
    \ <Application/x-tar>
    \ tar -tf %f

" gunzip archives
filetype *.gz gunzip %f

" openable
filetype {*.dmg,*.img,*.pkg} open

" documents
filetype {*.odt,*.doc,*.docx,*.xls,*.xlsx,*.odp,*.pptx,*.ppt},
    \ <Application/vnd.openxmlformats-officedocument.*,
        \ application/msword,
        \ application/vnd.ms-excel>
    \ open -a LibreOffice.app
fileviewer {*.doc},<Application/msword> antiword -
fileviewer {*.docx},
    \ <Application/
        \ vnd.openxmlformats-officedocument.wordprocessingml.document>
    \ docx2txt.pl %f -
