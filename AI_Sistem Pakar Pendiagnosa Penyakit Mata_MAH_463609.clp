; ==========================================
; Nama 	: Muhammad Arif Hidayat
; NIM 	: 20/463609/TK/51601
; Prodi : Teknologi Informasi 
; ==========================================

; ===========================================
; rules for statement 
; ===========================================

 (defrule Menu
 (not (start ?)) 
 =>
 (printout t crlf crlf crlf
 " ======================================================== " crlf
 " Selamat Datang di Sistem Pakar Pendiagnosa penyakit mata " crlf
 " dibuat oleh : Muhammad Arif Hidayat 20/463609/TK/51601 " crlf
 " ======================================================== " crlf crlf 
 " > pilih penyakit mata yang ingin didiagnosa" crlf
 "  > Edema Palpebra Inflamatoir     : 1 " crlf
 "  > Edema Palpebra nonInflamatoir  : 2 " crlf
 "  > Dermatitis Palpebra            : 3 " crlf
 "  > Blefaritis Ulserativa          : 4 " crlf
 "  > Blefaritis nonUlserativa       : 5 " crlf
 " pilih dengan cara menuliskan angka saja " crlf crlf 
 " Jawaban anda: " )
 (assert (start (read))))

;;@@@@@@ Edema Palpebra Inflamatoir @@@@@@
;------------------D1 S1------------------
 (defrule symptom-peradangan-mata
 (start 1)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > apakah anda mengalami gejala peradangan mata ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-peradangan-mata (read))))

;------------------D1 S2------------------
 (defrule symptom-glaukoma
 (symptom-peradangan-mata yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda mengidap penyakit mata Edema Palpebra Inflamatoir 33.3% " crlf
 " > apakah anda mengalami gejala glaukoma ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-glaukoma (read))))

;------------------D1 S3------------------
 (defrule symptom-alergi
 (symptom-glaukoma yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda mengidap penyakit mata Edema Palpebra Inflamatoir 66.6% " crlf
 " > apakah anda mengalami gejala alergi ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-alergi (read))))

;------------------D1 T------------------
 (defrule disease-edema-palpebra-inflamatoir-true
 (symptom-alergi yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan besar anda mengidap penyakit mata Edema Palpebra Inflamatoir 99.9% " crlf
 "   segera hubungi dokter untuk langkah lebih lanjut" crlf crlf))

;------------------D1 F------------------
 (defrule disease-edema-palpebra-inflamatoir-false
 (start 1)
 (or(symptom-peradangan-mata ~yes) 
    (symptom-glaukoma ~yes)
    (symptom-alergi ~yes))
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda tidak mengidap penyakit mata Edema Palpebra Inflamatoir " crlf crlf))


;;@@@@@@ Edema Palpebra nonInflamatoir @@@@@@
;------------------D2 S1------------------
 (defrule symptom-alergi2
 (start 2)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > apakah anda mengalami gejala alergi mata ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-alergi2 (read))))

;------------------D2 S2------------------
 (defrule symptom-gigitan-serangga
 (symptom-alergi2 yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda mengidap penyakit mata Edema Palpebra nonInflamatoir 33.3% " crlf
 " > apakah anda mengalami gejala gigitan serangga ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-gigitan-serangga (read))))

;------------------D2 S3------------------
 (defrule symptom-sistimik
 (symptom-gigitan-serangga yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda mengidap penyakit mata Edema Palpebra nonInflamatoir 66.6% " crlf
 " > apakah anda mengalami gejala alergi ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-sistimik (read))))

;------------------D2 T------------------
 (defrule disease-edema-palpebra-noninflamatoir-true
 (symptom-sistimik yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan besar anda mengidap penyakit mata Edema Palpebra nonInflamatoir 99.9% " crlf
 "   segera hubungi dokter untuk langkah lebih lanjut" crlf crlf))

;------------------D2 F------------------
 (defrule disease-edema-palpebra-noninflamatoir-false
 (start 2)
 (or(symptom-alergi2 ~yes) 
    (symptom-gigitan-serangga ~yes)
    (symptom-sistimik ~yes))
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda tidak mengidap penyakit mata Edema Palpebra nonInflamatoir " crlf crlf))


;;@@@@@@ Dermatitis Palpebra @@@@@@
;------------------D3 S1------------------
 (defrule symptom-alergi3
 (start 3)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > apakah anda mengalami gejala alergi mata ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-alergi3 (read))))

;------------------D3 S2------------------
 (defrule symptom-sekre-konjungtiva
 (symptom-alergi3 yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda mengidap penyakit mata Dermatitis Palpebra 50% " crlf
 " > apakah anda mengalami gejala sekre konjungtiva ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-sekre-konjungtiva (read))))

;------------------D3 T------------------
 (defrule disease-dermatitis-palpebra-true
 (symptom-sekre-konjungtiva yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan besar anda mengidap penyakit mata Dermatitis Palpebra " crlf
 "   segera hubungi dokter untuk langkah lebih lanjut" crlf crlf))

;------------------D3 F------------------
 (defrule disease-dermatitis-palpebra-false
 (start 3)
 (or(symptom-alergi3 ~yes) 
    (symptom-sekre-konjungtiva ~yes))
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda tidak mengidap penyakit mata Dermatitis Palpebra " crlf crlf))

;;@@@@@@ Blefaritis Ulserativa @@@@@@
;------------------D4 S1------------------
 (defrule symptom-krusta
 (start 4)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > apakah anda mengalami gejala krusta ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-krusta (read))))

;------------------D4 S2------------------
 (defrule symptom-bulu-mata-jatuh-tak-tumbuh
 (symptom-krusta yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda mengidap penyakit mata Blefaritis Ulserativa 33.3% " crlf
 " > apakah anda mengalami gejala bulu mata jatuh tak tumbuh lagi ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-bulu-mata-jatuh-tak-tumbuh (read))))

;------------------D4 S3------------------
 (defrule symptom-mata-kering
 (symptom-bulu-mata-jatuh-tak-tumbuh yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda mengidap penyakit mata Blefaritis Ulserativa 66.6% " crlf
 " > apakah anda mengalami gejala mata kering ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-mata-kering (read))))

;------------------D4 T------------------
 (defrule disease-blefaritis-ulserativa-true
 (symptom-mata-kering yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan besar anda mengidap penyakit mata Blefaritis Ulserativa 99.9% " crlf
 "   segera hubungi dokter untuk langkah lebih lanjut" crlf crlf))

;------------------D4 F------------------
 (defrule disease-blefaritis-ulserativa-false
 (start 4)
 (or(symptom-krusta ~yes) 
    (symptom-bulu-mata-jatuh-tak-tumbuh ~yes)
    (symptom-mata-kering ~yes))
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda tidak mengidap penyakit mata Blefaritis Ulserativa " crlf crlf))


;;@@@@@@ Blefaritis nonUlserativa @@@@@@
;------------------D5 S1------------------
 (defrule symptom-skwama
 (start 5)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > apakah anda mengalami gejala skwama ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-skwama (read))))

;------------------D5 S2------------------
 (defrule symptom-bulu-mata-jatuh-tumbuh
 (symptom-skwama yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda mengidap penyakit mata Blefaritis nonUlserativa 20% " crlf
 " > apakah anda mengalami gejala bulu mata jatuh tumbuh lagi ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-bulu-mata-jatuh-tumbuh (read))))

;------------------D5 S3------------------
 (defrule symptom-tak-tampak-krusta
 (symptom-bulu-mata-jatuh-tumbuh yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda mengidap penyakit mata Blefaritis nonUlserativa 40% " crlf
 " > apakah anda mengalami gejala tidak tampak krusta ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-tak-tampak-krusta (read))))

;------------------D5 S4------------------
 (defrule symptom-ketombe-kepala
 (symptom-tak-tampak-krusta yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda mengidap penyakit mata Blefaritis nonUlserativa 60% " crlf
 " > apakah anda mengalami gejala ada ketombe di kepala ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-ketombe-kepala (read))))

;------------------D5 S5------------------
 (defrule symptom-ketombe-mata-telinga
 (symptom-ketombe-kepala yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda mengidap penyakit mata Blefaritis nonUlserativa 80% " crlf
 " > apakah anda mengalami gejala ada ketombe di mata atau telinga ? (yes | no) " crlf crlf 
 " => Jawaban anda: " )
 (assert (symptom-ketombe-mata-telinga (read))))

;------------------D5 T------------------
 (defrule disease-blefaritis-nonulserativa-true
 (symptom-ketombe-mata-telinga yes)
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan besar anda mengidap penyakit mata Blefaritis nonUlserativa 99.9% " crlf
 "   segera hubungi dokter untuk langkah lebih lanjut" crlf crlf))

;------------------D5 F------------------
 (defrule disease-blefaritis-nonulserativa-false
 (start 5)
 (or(symptom-skwama ~yes)
    (symptom-tak-tampak-krusta ~yes) 
    (symptom-bulu-mata-jatuh-tumbuh ~yes)
    (symptom-ketombe-kepala ~yes)
    (symptom-ketombe-mata-telinga ~yes))
 =>
 (printout t crlf crlf crlf 
 " -------------------------------------------------------- " crlf
 " > kemungkinan anda tidak mengidap penyakit mata Blefaritis nonUlserativa " crlf crlf))
