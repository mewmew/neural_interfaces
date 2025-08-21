#let todo = highlight

#import "@preview/latex-lookalike:0.1.4"
#import "@preview/smartaref:0.1.0": cref

#show: latex-lookalike.style

// show rule for automatic cref of references.
#show ref: it => {
	let elem = it.element
	if elem == none {
		return it
	}
	cref(it)
}

#set text(size: 12.5pt)

#set text(lang: "sv")

#set page(
	margin: (x: 2.54cm, y: 2.54cm) // 1 inch
)

#show quote: set block(inset: (x: 1em))

#show list: set block(inset: (x: 1.5em))

#set heading(numbering: "1.1")

#set page(numbering: "1")

// TODO: \usepackage[parfill]{parskip}

#let author = [Robin Eklind]

#show title: set text(weight: "regular")

// === TODO ===
// * Verifiera att:
//     - Rapportdelen är objektiv.
//     - Diskussionsdelen inte tar upp nytt material.
// * Metatext som binder samman kortare paragrapher.
// * Sammanfattning efter diskussion?
// * Rättstavning
// * Ta bort förkortningar, t.ex. CI, om de inte används ofta.

// xxx Note from Peter:
// Lägg eventuellt in något i huvudpunkt 5 hur skydda individens integritet
// utöver det som finns i punkt 5.1.4 och utöka eventuellt detta i punkt 5.1.4.
// xxx

// xxx Note from Peter:
// Skriv eventuellt i punkt 5.1.6 om hur en ska förhindra missbruk.
// xxx

// xxx Note from Honke:
// Finger känns av annan person.
// xxx

// --- [ title page ] ----------------------------------------------------------

#v(1.7cm)

#align(center)[
	#title[Neurala gränssnitt]

	#v(0.6cm)

	#text(size: 1.3em)[#author]

	#v(0.2cm)

	#text(size: 1.3em)[#datetime.today().display()]
]

#v(1fr)

#quote(
	block: true,
	attribution: [Arthur C. Clarke @clarke_quote],
	[#emph["Any sufficiently advanced technology is indistinguishable from magic."]],
)

#pagebreak(weak: true)

#outline()

#pagebreak(weak: true)

// === [ Introduktion ] ========================================================

= Introduktion

Vi lever i en tid där informationsutbyte blomstrar och vetenskapliga upptäckter skapar interdisciplinära synergieffekter. Banbrytande framsteg kommer med allt tätare intervall och inom många områden är utvecklingshastigheten exponentiell @exponential.

På Sahlgrenska Universitetssjukhuset utfördes tidigare under året en operation där en patient förseddes med en permanent muskel- och nervstyrd armprotes. Eftersom protesens elektroder ansluts direkt till nerverna är det möjligt att både skicka och ta emot nervsignaler. Hjärnan kan intuitivt kontrollera protesens rörelser genom att skicka motoriska nervimpulser. Ännu mer sensationellt är att känselintryck kan förmedlas tillbaka till hjärnan genom stimulering av nerverna @prosthetic_operation.

I pressmeddelandet poängteras det etablerade samarbetet mellan de olika disciplinerna:
#quote(
	block: true,
	[#emph["Samverkan mellan flera olika områden (medicin, biomaterial, mekatronik, analog och digital elektronik, artificiell intelligens, biomekanik etc.) är en förutsättning för detta komplexa projekt."] @prosthetic_operation]
)

Nervstyrda proteser har möjliggjorts tack vare så kallade #emph[neurala gränssnitt] som skapar en kommunikationskanal mellan elektroniska komponenter och hjärnan. Genom detta gränssnitt länkas våra sinnen och tankar samman med den digitala världen. Vi står en spännande tid till mötes då neurala gränssnitts sanna potential börjar utforskas.

// --- [ Syfte ] ----------------------------------------------------------------

== Syfte

Syftet med denna rapport är att grovt sammanfatta hur dagens neurala gränssnitt fungerar och används, resonera kring deras framtida potential samt belysa teknikens etiska och moraliska aspekter.

// === [ Neurala gränssnitt ] ===================================================

= Neurala gränssnitt

Syn, hörsel, känsel och motoriska färdigheter är så fundamentala för våra liv att vi ofta tar dem för givet. Dessa förmågor är så djupt integrerade i vår vardag att de personer som förlorar någon av dem ofta drabbas av depression @depression. Med hjälp av neurala gränssnitt har det visat sig vara möjligt att återställa både sensoriska @sight1 @sound @touch och motoriska förmågor @prosthetic_operation, och därmed förbättra livskvaliteten hos de drabbade.

Neurala gränssnitt är ett tvärvetenskapligt område som drar nytta av framsteg inom såväl data- och neurovetenskap som maskininlärning och materialvetenskap. Centralt för området är dock studierna kring hur hjärnan kommunicerar med resten av kroppen.

Generellt sett så skickar hjärnan ut motoriska kommandon och tar emot sensorisk stimuli. All information som skickas till och från hjärnan måste omkodas innan den kan överföras i form av nervsignaler. Denna omkodning kan liknas med den översättning, mellan olika tecken och unika sekvenser av ettor och nollor, som sker inom datorer. Neurala gränssnitt skapar en länk mellan hjärnan och elektroniska komponenter som gör det möjligt att skicka och ta emot nervsignaler. För att kunna kommunicera med hjärnan måste nervsignalerna i sin tur kodas och avkodas på ett korrekt sätt; mer om detta i @enc_dec.

Det finns en rad olika neurala gränssnitt med respektive för- och nackdelar. En del neurala gränssnitt ansluts direkt till nerverna eller direkt till hjärnan och kräver därför kirurgiska ingrepp. Andra neurala gränssnitt kan på avstånd mäta de magnetfält som alstras av nervimpulser i hjärnan, och kräver därför inga kirurgiska ingrepp; mer om detta i @meg.

Vissa neurala gränssnitt är begränsade till envägskommunikation; de kan antingen skicka eller ta emot nervsignaler. Andra neurala gränssnitt har möjlighet att kommunicera i båda riktningarna, det vill säga de kan både skicka och ta emot nervsignaler.

// --- [ Kodning och avkodning av nervsignaler ] --------------------------------

== Kodning och avkodning av nervsignaler
<enc_dec>

Ögonproteser @sight2 och cochleaimplantat @sound skickar visuell respektive auditativ stimuli till hjärnan och förser således användaren med syn respektive hörsel. För att hjärnan ska kunna förstå de stimuli som skickas, måste informationen omkodas på ett korrekt sätt.

Genom att studera de nervsignaler som normalt sett skickas från ögat via synnerven till hjärnan har en lyckats härleda hur den visuella informationen ska omkodas. Istället för att skicka hela synintrycket vid varje tillfälle så skickas bara de förändringar som registrerats. På så sätt kan vi lättare reagera på förändringar i vår omgivning och slipper samtidigt belasta hjärnan med onödig information @sight1. Detta kan liknas vid hur olika filmformat endast lagrar förändringar mellan bildsekvenser, så kallade frames, för att minska filstorleken och öka överföringshastigheten. Liknande forskning har bedrivits för att studera hur auditativ stimuli från örat omkodas innan de överförs via hörselnerven till hjärnan.

Studier av nervimpulser som skickas från hjärnan via motoriska nerver till muskler i armar och ben har lyckats härleda hur rörelsekommandon kan avkodas. Tack vare denna kunskap har tankestyrda arm- och benproteser kunnat utvecklas @prosthetic_operation.

// --- [ Algoritmer för neural kodning och avkodning ] --------------------------

== Algoritmer för neural kodning och avkodning

Utvecklandet av algoritmer är ett viktigt forskningsområde inom neurala gränssnitt. Det är algoritmer som sköter kodningen och avkodningen av nervsignaler, vilket ställer höga krav på korrekthet och till viss del hastighet.

Inkorrekt avkodning av nervsignaler skulle resultera i att arm- och benproteser utför felaktiga motoriska kommandon. Inkorrekt kodning av nervsignaler skulle resultera i en felaktig varseblivning då hjärnan inte kan tolka de stimuli som överförs. Hos ögonproteser och cochleaimplantat skulle detta medföra kaotiska syn- och hörselintryck.

// ### continue here ###

//#todo[xxx TODO: Om algoritmerna inte kodar och avkodar nervsignalerna tillräckligt snabbt kommer användaren uppleva ett lagg mellan... xxx]

Algoritmer används även för att filtrera bort ointressant information och korrigera mätstörningar. Till exempel kan algoritmer känna igen mönster för blinkningar och på så sätt filtrera bort dem från mätdatan.

// === [ Envägskommunikation ] ==================================================

= Envägskommunikation

En rad olika neurala gränssnitt kan etablera envägskommunikation med hjärnan, där de antingen skickar eller tar emot nervsignaler. De neurala gränssnitt som läser av nervsignaler från hjärnan kallas brain-computer interfaces medan de som skickar nervsignaler till hjärnan kallas computer-brain interfaces. Dessa redovisas mer ingående nedan.

//#todo[xxx TODO: Med hänsyn till risk för hälsoskada... Neurala gränssnitt som endast har möjlighet att läsa av nervimpulser bör medföra mindre risk för hälsoskada än de gränssnitt som har möjlighet att skicka.... xxx]

//Envägskommunikation som läser av hjärnsignaler, men inte skickar några nervimpulser till hjärnan skulle kunna ses som ett säkrare alternativ eftersom det finns mindre risk för att för starka eller felaktiga nervimpulser skickas till hjärnan.

// --- [ Brain-computer interfaces ] --------------------------------------------

== Brain-computer interfaces

Neurala gränssnitt som läser av hjärnaktivitet eller tar emot nervsignaler möjliggör kommunikation från hjärnan till digitala komponenter. Dessa grässnitt kallas för brain-computer interfaces (BCI) och används i bland annat arm- och benproteser som behöver ta emot motoriska nervsignaler från hjärnan.

Nedan redovisas några olika typer av brain-computer interfaces samt för- och nackdelar hos respektive typ.

// ~~~ [ Ytelektroder ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

=== Ytelektroder

Genom att fästa ytelektroder på huden kan de motoriska nervsignalerna som skickas från hjärnan avläsas i form av elektrisk muskelaktivitet. För att fästa dessa ytelektroder krävs inga kirurgiska ingrepp, vilket gör att de lätt kan användas av vem som helst.

Denna teknik har länge använts av arm- och benproteser, men antalet unika rörelsemönster som kan förmedlas via gränssnittet är begränsat. När huden rör på sig så förflyttas ytelektroderna vilket påverkar avläsningen av impulsen. Även svett påverkar impulsen vilket kan göra avläsningarna mindre pålitliga @prosthetic_operation.

// ~~~ [ Elektroencefalografi ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

=== Elektroencefalografi

Elektroencefalografi (EEG) använder sig också av ytelektroder, men istället för att fästa dem på musklerna så placeras de ut i ett rutmönster på skalpen. Där mäter elektroderna den elektriska aktivitet som uppstår i samband med nervsignalerna i hjärnan. Resultatet brukar ofta presenteras i form av hjärnvågor.

Fördelen med EEG är att inga kirurgiska ingrepp krävs för att fästa elektroderna på skaplen. Samtidigt finns det en del nackdelar med EEG. Att applicera den gel som håller elektroderna på plats brukar vara en tidskrävande process. Det finns risk för att EEG ger missvisande resultat på grund av olika mätstörningar som kan orsakas av bland annat ögonrörelser. Precisionen hos EEG-resultat är inte särskilt hög och det kan vara svårt att härleda exakt vilket område i hjärnan som gav upphov till en viss elektrisk aktivitet. Däremot kan nya mätvärden avläsas flera hundra gånger per sekund.

// xxx TODO xxx
// * Add ref to section about fMRI when it is written.
// xxxxxxxxxxxx

Idag kombineras ofta resultat från EEG och funktionell magnetresonanstomografi (förkortas fMRI på engelska) för att få ut det bästa av två världar. De kompletterar varandra väl eftersom fMRI kan ta ett fåtal mätvärden per sekund med väldigt hög precision @eeg_fmri.

// ~~~ [ Magnetencefalografi ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

=== Magnetencefalografi
<meg>

Enligt ett av elektromagnetismens postulat så ger rörelsen av elektriska laddningar upphov till magnetfält @electromagnetism. Magnetencefalografi utnyttjar detta fenomen för att mäta magnetfälten som alstras av elektriska nervsignaler i hjärnan. På så sätt kan utsprunget till nervaktivitet i hjärnan lokaliseras.

Magnetencefalografi kräver inga kirurgiska ingrepp och kan på många sätt liknas med EEG. Samtidigt finns en del skillnader mellan teknikerna. Medan EEG mäter elektriska nervimpulser så mäter magnetencefalografi de magnetfält som alstras av de elektriska nervimpulserna. Precisionen hos magnetencefalografi är lika hög eller högre än den hos EEG och mätvärden kan tas lika ofta. Däremot har EEG möjlighet att mäta av nervaktivitet från fler områden i hjärnan @meg_eeg.

//=== Funktionell magnetresonanstomografi
//
//#todo[xxx TODO: skriv. xxx]
//
//Funktionell magnetresonanstomografi (förkortas fMRI på engelska)...

// --- [ Computer-brain interfaces ] --------------------------------------------

== Computer-brain interfaces

Neurala gränssnitt som möjliggör kommunikation från digitala komponenter till hjärnan kallas för computer-brain interfaces (CBI). I @BBI redovisas ett exempel på användning av CBI.

// ~~~ [ Högintensivt fokuserat ultraljud ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

=== Högintensivt fokuserat ultraljud

Högintensivt fokuserat ultraljud kan användas för att stimulera specifika nervceller i hjärnan med hög precision. Genom att aktivera olika områden i hjärnan är det till exempel möjligt att kontrollera muskelrörelser @bbi. Läs mer om hur högintensivt fokuserat ultraljud kan användas i brain-brain interfaces under @BBI.

//=== Transkraniell magnetstimulering

// TODO: lägg till avsnitt om TMS (transcranial magnetic stimulation).

//=== Djup hjärnstimulering

// TODO: lägg till avsnitt om DBS (deep brain stimulation).

// --- [ Brain-brain interfaces ] -----------------------------------------------

== Brain-brain interfaces
<BBI>

Brain-brain interfaces (BBI) skulle kunna ses som envägskommunikation i två steg. I första steget överförs motoriska kommandon från hjärnan hos en individ via BCI till en dator. I andra steget överförs sedan dessa motoriska kommandon från datorn via CBI till hjärnan hos en annan individ.

Tidigare under året redovisade forskare från Harvard ett experiment där en människa genom enbart tankar kunde kontrollera svansrörelserna hos en råtta @bbi. Det spektakulära är att inga kirurgiska ingrepp krävdes för att utföra experimentet.

I experimentet analyserades personens tankar med hjälp av BCI och överfördes sedan till datorns i form av "uppåt-" och "nedåtkommandon". Sedan användes högintensivt fokuserat ultraljud för att stimulera de motoriska områden i hjärnan som kontrollerar antingen "uppåt-" eller "nedåtrörelser" med svansen.

// === [ Tvåvägskommunikation ] =================================================

= Tvåvägskommunikation

Neurala gränssnitt med stöd för tvåvägskommunikation kan både skicka och ta emot nervsignaler från hjärnan. I inledningen såg vi ett exempel på hur dessa gränssnitt kan användas för att både ta emot motoriska kommandon från hjärnan samt skicka sensorisk stimuli till hjärnan.

// xxx TODO xxx
// * Utveckla nedanstående stycke så att sambandet syns tydligare.
// xxxxxxxxxxxx

Det är extremt viktigt med känsel för att kunna greppa föremål utan att antingen tappa eller krossa dem. Känselintryck är dessutom fundamentala för att personen ska acceptera protesen som en del av sin kropp#footnote[I dagsläget väljer ungefär hälften av personer med protes att ta av sig protesen när den inte används, då protesen känns mer som ett verktyg än en del av deras kropp.] @prosthetic_operation.

//#todo[xxx TODO: skriv om fördelar med tvåvägskommunikation för proteser. Samma risker som hos CBI. xxx]
//
//Proteser använde tidigare envägskommunikation och ...
//
//== Targeted reinnervation
//
//#todo[xxx TODO: skriv/omformulera. xxx]
//
//Operation som ansluter nerver till andra muskelgrupper. Stimulerar ...
//
//Patienter som endast amputerat nedre delen av armen kan använda ytelektroder ...
//
//Normalt sett används ytelektroder...
//
//Eftersom det inte längre fanns muskler som nervtrådarna var ansluta till i armen så utförs en operation där nervtrådarna kopplas till bröstmusklerna istället. En överraskande upptäckt var att patienterna fick varseblivning av sin amputerade arm vid beröring på bröstet.

//Med hjälp av en reinnovativ operation ansluts nerverna till andra muskelområden på kroppen för att sedan kunna användas tillsammans med neuromuscular ... Visade sig även ge känsel via huden ...

//== Direktanslutna elektroder
//
//#todo[xxx Val av rubrik: Direktanslutna/neurala elektroder, Elektroder anslutna till nerverna xxx]
//
//#todo[xxx TODO: skriv. xxx]
//
//Neurala elektroder ansluter direkt till nervtrådarna ...
//
//@prosthetic_operation + den andra referensen från Chalmers. Osseointegrerade implantat (titan)

//Eftersom det krävs en operation är dessa ingrepp riskabla. Samtidigt ger de en enorm potential eftersom det går att xxxtargetxxx enskilda nerver, nervbanor samt nervceller ...

//== Micro-chip implantat
//
//#todo[xxx TODO: skriv. Extrema exempel: fjärrstyrning av insekter. Hjärna från ål som kontrollerar ett fordon (oklart viken metod som användes men troligen micro-chip eller direktanslutna elektroder)... xxx]
//
//Implantat av micro-chip direkt in i hjärnan ...

//Because they lie in the grey matter, invasive devices produce the highest quality signals of BCI devices but are prone to scar-tissue build-up, causing the signal to become weaker, or even non-existent, as the body reacts to a foreign object in the brain.

// === [ Diskussion ] ===========================================================

= Diskussion

Alla tekniska framsteg kan användas för såväl gott som ont. Ett känt citat på temat från Marie Curie lyder:

#quote(
	block: true,
	attribution: [Marie Curie @curie_quote],
	emph["I am one of those who think like Nobel, that humanity will draw more good than evil from new discoveries."],
)

Även om framsteg inom vetenskap och forskning kommer resultera i mer gott än ont, så är det vårt etiska och moraliska ansvar att försöka föreställa oss teknikens framtida roll och användningsområden. Vilken potential har tekniken och hur kan den missbrukas?

// --- [ Potential och framtida användningsområden ] ----------------------------

== Potential och framtida användningsområden

Endast vår fantasi och uppfinningsrikedom begränsar potentialen hos neurala gränssnitt. Eftersom neurala gränssnitt visats kapabla att överföra sinnesintryck för syn @sight1 @sight2, hörsel @sound och känsel @touch bör det ses som en tidsfråga innan alla sorters stimuli kan överföras. Nedan redovisas exempel på några framtida användningsområden.

// ~~~ [ Provsmakning av recept via Internet ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

=== Provsmakning av recept via Internet

Tänk om det vore möjligt att gå in på en hemsida och provsmaka olika recept. De stimuli som ger upphov till en smakupplevelse kunde då överföras via Internet till användarens neurala gränssnitt.

// ~~~ [ Ultraportabla enheter ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

=== Ultraportabla enheter

Föreställ dig en ultraportabel laptop utan skärm, mus, tangentbord och högtalare där all interaktion sker via neurala gränssnitt.

Neurala gränssnitt har möjligheten att revolutionera hur vi interagerar med digitala enheter. Redan 2003 användes neurala gränssnitt för att kontrollera muspekare med hjälp av tankarna @cursor1. Sedan dess har tekniken fortsatt att utvecklas. Genom förbättrade algoritmer lyckades forskare från Stanford förra året fördubbla hastigheten hos tankestyrda muspekare @fast_cursor.

Ögonproteser använder sig av neurala gränssnitt för att överföra visuell stimuli till hjärnan @prosthetic_operation. Informationen som normalt sätt representeras med hjälp av en bildskärm skulle istället kunna överföras via neurala gränssnitt.

//=== Inspelning av drömmar
//
//#todo[xxx TODO: skriv xxx]
//
//ref: Solve for X - Imaging the minds eye.

// ~~~ [ Kollektivt minne ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

=== Kollektivt minne

Med ökad förståelse för hur minnen lagras och återkallas borde det vara möjligt att överföra minnen via neurala gränssnitt och på så sätt digitalisera dem. Detta skulle utöka vår minneskapacitet och göra det möjligt att ta säkerhetskopior av viktiga minnen.

Självklart finns det många integritetsaspekter att ta hänsyn till och känsliga minnen måste kunna skyddas på ett säkert sätt. Samtidigt ger denna teknik oss nya kraftfulla kollaborationsverktyg.

Tänk om användare kunde välja att dela med sig av specifika minnen och lagra dessa i en kollektiv minnesdatabas. Genom att efterlikna hur hjärnan lagrar minnen vore det möjligt att associativt länka samman informationen. Via neurala gränssnitt kan sedan vem som helst ansluta sig till och använda sig av det kollektiva minnet.

Genom det kollektiva minnet vore det möjligt att minnas en plats du aldrig besökt och ta del av dess unika kultur- och smakupplevelser samt att dela en uppsjö av andra sinnesintryck.

//exocortex

// ~~~ [ Utökad sinnesrepertoar ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

=== Utökad sinnesrepertoar

Dagens neurala gränssnitt kan återställa sinnesintryck för syn @sight1, hörsel @sound och känsel @touch. Morgondagens neurala gränssnitt skulle kunna utöka kapaciteten hos våra nuvarande sinnen.

Tänk om vi kunde utöka vårt synliga ljusspektra så det inkluderade infrarött och ultraviolett ljus. Det finns så mycket vackert här i världen som vi då skulle kunna ta del av! Bland annat skulle vi få bevittna de unika ultravioletta mönster som finns hos korallrevsfiskar @uv_patterns och blommor.

Utöver vanliga sinnesintryck har det visat sig möjligt att överföra stimuli för sinnen vi ännu inte besitter. Hjärnan arbetar först hårt med att analysera de okända sinnesintrycken men lär sig efter ett tag hur de ska tolkas. Att lära sig tolka nya sorters stimuli kan jämföras med att förstå sig på nya språk, det är svårt i början men känns så småningom intuitivt @learn_sense.

Så vilka sinnen vill vi berikas med? Nedan ges exempel på några av de fascinerande sinnen som finns representerade i djurriket:

- #emph[Magnetoreception] utgörs av förmågan att känna av magnetfält. Flyttfåglar använder detta sinne för att navigera.
- #emph[Sonar] utgörs av förmågan att varsebli sin omgivning genom att tolka reflekterande ljud. Fladdermöss är kända för att navigera med hjälp av sonar.
- #emph[Elektroreception] utgörs av förmågan att upptäcka elektriska fält i sin omgivning. Hajar använder denna förmåga för att lokalisera byten.

Utöver redan befintliga sinnen vore det möjligt att överföra sinnesintryck för helt artificiella sinnen. Till exempel skulle GPS-koordinaterna för ens nuvarande position kunna överföras via det neurala gränssnittet. Så småningom lär sig hjärnan att tolka den nya information och vi berikas då med ett sinne för positionering.

// ~~~ [ Överföring av känslor och sinnestillstånd ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

=== Överföring av känslor och sinnestillstånd

Vårt språk är begränsat när det gäller att överföra en exakt representation av vårt sinnestillstånd eller känslorna vi känner i ett givet ögonblick. Tänk om det vore möjligt att överföra känslor eller sinnestillstånd till en annan person och låta dem känna exakt det du känner.

Uttryck som "om du bara visste hur starkt jag känner inför dig" kunde istället överföras och känslointrycken kunde fullkomligt omsvepa personen i fråga. Självklart behöver en ta hänsyn till etiska och moraliska aspekter. Exempelvis borde det endast vara möjligt att överföra en känsla eller ett sinnestillstånd med mottagarens samtycke.

// --- [ Etiska och moraliska aspekter ] ----------------------------------------

== Etiska och moraliska aspekter

// ref: TED: Paul Root Wolpe - It's time to question bio-engineering
// * Control of movement
//    - Rats
//    - Cockroaches
//    - Flying beetles
//    - Moth pre-wired from pupa-stage.
// * 100,000 brain cells from a mouse brain used as the primary computer to control a flight simulator.

Med neurala gränssnitt ges vi för första gången möjligheten att kontrollera inte bara aspekter av vår omvärld utan även de mest fundamentala aspekterna av vad det innebär att vara människa.

Kan vi förutsäga hur tekniken kommer användas? De flesta anser nog att neurala gränssnitt borde få användas för att återställa syn, hörsel och rörelseförmågor hos personer med motsvarande funktionsnedsättning. Något svårare är det att enhetligt säga om vi bör få utöka, förbättra och förändra våra förmågor.

Självklart borde varje person fritt få bestämma över sin egen kropp och sitt eget sinne. Det moraliska dilemmat uppstår ifall normen skulle bli att utöka sin sinnesrepertoar och förbättra sina mentala och till viss del fysiska förmågor. Efter ett tag tas det fria valet bort från minoriteten om de vill fortsätta att leva ett "normalt" liv, eftersom normen blivit att vara ansluten till det kollektiva minnet. Utan att själv ansluta dit så går det inte längre att konkurrera inom vissa områden @ethics_eu @ethics1. En parallell kan dras till dagens ökade användande av smarta mobiltelefoner och Facebook, vilket kan leda till en distansering mellan anslutna och icke-anslutna personer.

En annan etisk och moralisk aspekt att ta hänsyn till är i vilken mån vi har rätt att bedriva experiment på djur. Till exempel så har vi utfört experiment som gör det möjligt att fjärrstyra skalbaggar och andra insekter @ethics2. Det är svårt att dra en gräns mellan vad som ska vara tillåtet inom forskning. Framstegen kan underlätta och minska lidandet för så många, men samtidigt borde vissa etiska grundprinciper krävas inom forskning.

= Slutord

Sammanfattningsvis, och med risk för repetition, tror jag likt Marie Curie -- som i sin tur likt Alfred Nobel -- att forskning och framsteg kommer användas för mer gott än ont; så även vid utvecklandet och nyttjandet av neurala gränssnitt i samhället.

Neurala gränssnitt ger personer möjlighet att återfå eller berikas med sinnen som syn, hörsel och känsel; vilka alla har djup inverkan på ens livskvalitet och psykiska välbefinnande. Tänk dig att kunna återfå känsel av att hålla någon i handen eller få se sina barnbarn för första gången i livet.

Exakt hur neurala gränssnitt kommer nyttjas framöver återstår att se. Vi står en spännande framtid till mötes!

//Gränsen är svår att dra mellan forskning och framsteg och

//Ett moraliskt dilemma kan behöva ställas inför är

//För att konkretisera

//För att reflektera kring de

//#todo[xxx TODO: write. ref: TED talk om etik om moral. xxx]

//Teknikens förmågor går hand i hand med dess potential för missbruk.
//
//Maktverktyg som har en enorm potential för missbruk. Focused ultrasound för att kontrollera personers tankar och känslor.
//
//Risk med operationer @dbs_parkinsons1.

//Styra insekter med micro-chip, ålhjärna, ...

//Neuroetik - SMER "Kan en och bör en förbättra människans kognitiva förmågor?".

// * Biologiska datorer, ål vars hjärna används för att styra en bil.
// * Implantera tankar.

// === [ Bibliography ] ========================================================

#pagebreak(weak: true)

// american-society-of-mechanical-engineers
//
//    [5–7]
//
//    [1] Clarke, A. C., 1973, Profiles of the Future: An Enquiry Into the Limits of the Possible, Harper & Row.
//    [2] Kraft, D., 2010, ”Medicine's future? There's an app for that”.
//    [3] Chalmers universitet, 2013, ”Världspremiär för muskel- och nervstyrd armprotes”.
//    [4] Shepherd, J., 2012, ”A broken body isn't a broken person”. [Online]. Available: https://www.ted.com/talks/janine_shepherd_a_broken_body_isn_t_a_broken_person?language=en.
//    [6] Wilson, B. S., och Dorman, M. F., 2008, ”Cochlear implants: a remarkable past and a brilliant future”, Hearing research, 242(1–2), s. 3–12.

// institute-of-electrical-and-electronics-engineers
//
//    [5], [6], [7]
//
//    [1] A. C. Clarke, Profiles of the Future: An Enquiry Into the Limits of the Possible. Harper & Row, 1973.
//    [2] D. Kraft, ”Medicine's future? There's an app for that”. april 2010.
//    [3] Chalmers universitet, ”Världspremiär för muskel- och nervstyrd armprotes”. 2013.
//    [4] J. Shepherd, ”A broken body isn't a broken person”. [Online]. Tillgänglig vid: https://www.ted.com/talks/janine_shepherd_a_broken_body_isn_t_a_broken_person?language=en
//    [6] B. S. Wilson och M. F. Dorman, ”Cochlear implants: a remarkable past and a brilliant future”, Hearing research, vol. 242, nr 1–2, s. 3–12, 2008.

// nature
//
//    #sup[5-7]
//
//    1. Clarke, A. C. Profiles of the Future: An Enquiry Into the Limits of the Possible. (Harper & Row, 1973).
//    2. Kraft, D. Medicine's future? There's an app for that. (2010).
//    3. Chalmers universitet. Världspremiär för muskel- och nervstyrd armprotes. (2013).
//    4. Shepherd, J. A broken body isn't a broken person. https://www.ted.com/talks/janine_shepherd_a_broken_body_isn_t_a_broken_person?language=en (2012).
//    6. Wilson, B. S. & Dorman, M. F. Cochlear implants: a remarkable past and a brilliant future. Hearing research 242, 3–12 (2008).

// spie
//
//
//    #sup[5-7]
//
//    1. A. C. Clarke, Profiles of the Future: An Enquiry Into the Limits of the Possible, Harper & Row (1973).
//    2. D. Kraft, ”Medicine's future? There's an app for that” (2010).
//    3. Chalmers universitet, ”Världspremiär för muskel- och nervstyrd armprotes” (2013).
//    4. J. Shepherd, ”A broken body isn't a broken person”, oktober 2012, <https://www.ted.com/talks/janine_shepherd_a_broken_body_isn_t_a_broken_person?language=en>.
//    6. B. S. Wilson och M. F. Dorman, ”Cochlear implants: a remarkable past and a brilliant future”, Hearing research 242(1–2), 3–12 (2008).

// the-institution-of-engineering-and-technology
//
//    [5–7]
//
//    1 Clarke, A.C.: ”Profiles of the Future: An Enquiry Into the Limits of the Possible” (Harper & Row, 1973)
//    2 Kraft, D.: ”Medicine's future? There's an app for that” (2010)
//    3 Chalmers universitet: ”Världspremiär för muskel- och nervstyrd armprotes” (2013)
//    4 Shepherd, J.: ”A broken body isn't a broken person”, https://www.ted.com/talks/janine_shepherd_a_broken_body_isn_t_a_broken_person?language=en
//    6 Wilson, B.S., Dorman, M.F.: ”Cochlear implants: a remarkable past and a brilliant future”Hearing research, 2008, 242, (1–2), s. 3–12.
#bibliography("referenser.bib", style: "american-society-of-mechanical-engineers")
