--[[
    Escape from ghost!
    Developed by Jp_darkuss#4806
]]--
---------------------------------------------------------------------
local time= 0
local gaming= false
local hub='<C><P F="8" /><Z><S><S L="801" o="0" H="26" X="399" Y="388" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="24" o="ffffff" H="26" X="11" Y="388" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="24" o="ffffff" X="62" Y="388" T="12" H="26" /><S L="24" o="ffffff" X="112" H="26" Y="388" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="24" o="ffffff" X="163" H="26" Y="388" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="24" o="ffffff" H="26" Y="388" T="12" X="213" /><S L="24" o="ffffff" H="26" X="263" Y="388" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="24" o="ffffff" X="315" Y="388" T="12" H="26" /><S L="24" o="ffffff" X="366" H="26" Y="388" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="24" o="ffffff" H="26" Y="388" T="12" X="418" /><S L="24" o="ffffff" H="26" X="469" Y="388" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="24" o="ffffff" X="520" Y="388" T="12" H="26" /><S L="24" o="ffffff" X="570" H="26" Y="388" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="24" o="ffffff" H="26" Y="388" T="12" X="619" /><S L="24" o="ffffff" H="26" X="669" Y="388" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="24" o="ffffff" X="720" Y="388" T="12" H="26" /><S L="24" o="ffffff" X="768" H="26" Y="388" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="800" o="705b59" H="11" X="400" Y="3" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="705b59" H="378" X="4" Y="186" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="11" o="705b59" H="376" X="794" Y="187" T="12" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="200" X="399" /><P P="0,0" C="581e17,4a2d10" Y="-3" T="117" X="0" /><P P="0,0" C="623b2a" Y="374" T="104" X="400" /><P P="0,0" Y="335" T="106" X="339" /><P P="0,0" Y="226" T="112" X="69" /><P P="0,0" Y="334" T="113" X="462" /><P P="0,0" Y="75" T="111" X="789" /><P P="0,0" Y="85" T="110" X="7" /><P P="0,0" C="92d4ee" Y="369" T="125" X="731" /><P P="0,0" C="784939,a31638" Y="374" T="127" X="507" /><P P="0,0" C="784939,a31638" Y="370" T="127" X="289" /><P P="0,0" C="784939,a31638" Y="370" T="127" X="289" /><P P="0,0" Y="41" T="108" X="680" /><P P="0,0" C="cf6a27,95d9d6,665c50,e9e2da" Y="5" T="102" X="405" /></D><O /></Z></C>'
local Ghost= {}
local maps= {
    '<C><P F="3" /><Z><S><S L="371" H="18" X="185" Y="390" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="160" H="52" X="721" Y="374" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="497" H="22" X="396" Y="120" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" H="201" X="651" Y="209" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="35" H="33" X="425" Y="361" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="35" X="504" H="33" Y="323" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="35" H="33" X="584" Y="361" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="17" H="94" X="156" Y="156" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="82" H="58" X="42" Y="223" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="65" H="42" X="269" Y="211" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="137" H="48" X="573" Y="211" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" H="87" X="20" Y="88" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="82" H="40" X="42" Y="320" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="66" H="47" X="269" Y="302" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="67" H="28" X="180" Y="55" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="61" H="30" X="294" Y="55" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" X="384" Y="46" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="51" H="31" X="404" Y="54" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="51" X="497" H="31" Y="53" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="67" X="630" H="28" Y="55" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="36" H="158" X="426" Y="265" T="9" P="0,0,,,,0,0,0" /></S><D><DS Y="292" X="505" /></D><O /></Z></C>',
    '<C><P F="0" /><Z><S><S L="1415" H="376" X="394" Y="547" T="8" P="0,0,0.3,0.2,0,0,0,0" /><S L="113" H="25" X="56" Y="261" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="38" H="36" X="172" Y="216" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="38" X="245" H="36" Y="173" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="29" H="242" X="341" Y="312" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="33" H="137" X="418" Y="350" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="34" H="57" X="498" Y="387" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="36" H="211" X="245" Y="341" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="115" H="34" X="57" Y="343" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="138" H="62" X="703" Y="213" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="138" X="702" H="62" Y="332" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="138" H="62" X="704" Y="89" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="23" H="115" X="573" Y="139" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="23" X="573" H="115" Y="297" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="38" H="36" X="169" Y="119" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="38" X="245" H="36" Y="61" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="38" H="36" X="481" Y="99" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="38" X="84" H="36" Y="118" T="5" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="169" X="344" /></D><O /></Z></C>',
    '<C><P F="5" /><Z><S><S L="150" H="111" X="375" Y="434" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="76" H="109" X="562" Y="436" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="79" H="102" X="758" Y="433" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="142" H="18" X="193" Y="353" T="1" P="0,0,0,0.2,-40,0,0,0" /><S L="165" H="98" X="83" Y="427" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="78" H="19" X="277" Y="310" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="10" X="5" Y="26" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="25" H="257" X="12" Y="149" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="24" H="118" X="788" Y="60" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="21" H="57" X="327" Y="291" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="17" H="88" X="404" Y="298" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="19" H="80" X="535" Y="304" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="17" H="90" X="728" Y="302" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="101" H="41" X="160" Y="169" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="98" X="435" H="38" Y="173" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="176" H="23" X="541" Y="128" T="1" P="0,0,0,0.2,40,0,0,0" /><S L="98" H="38" X="436" Y="84" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="95" H="39" X="626" Y="179" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="194" H="18" X="299" Y="182" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="10" X="68" Y="294" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="23" H="263" X="787" Y="249" T="9" P="0,0,,,,0,0,0" /></S><D><DS Y="137" X="434" /></D><O /></Z></C>',
    '<C><P F="7" /><Z><S><S L="53" X="405" H="10" Y="380" T="2" P="0,0,0,1.2,0,0,0,0" /><S L="53" H="10" X="569" Y="319" T="2" P="0,0,0,1.2,0,0,0,0" /><S L="150" H="50" X="75" Y="382" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="132" H="39" X="366" Y="400" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="258" H="139" X="671" Y="390" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="34" H="32" X="489" Y="355" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="34" X="225" H="32" Y="374" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="114" H="39" X="57" Y="294" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="114" H="39" X="57" Y="60" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="114" X="296" H="39" Y="98" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="114" H="39" X="293" Y="192" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="114" X="291" H="39" Y="286" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="114" X="56" H="39" Y="178" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="142" H="49" X="728" Y="108" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="141" H="46" X="729" Y="236" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="116" H="44" X="503" Y="101" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="116" X="503" H="44" Y="198" T="0" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="361" X="361" /></D><O><O C="4" Y="132" X="160" P="-30" /><O C="11" Y="180" P="0" X="78" /><O C="4" Y="227" P="-30" X="155" /><O C="11" Y="85" P="0" X="243" /><O C="11" Y="274" P="0" X="73" /><O C="11" Y="180" P="0" X="237" /></O></Z></C>',
    '<C><P F="3" /><Z><S><S L="76" o="324650" H="10" X="394" Y="407" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="76" o="324650" X="799" Y="401" T="13" H="10" /><S L="76" o="324650" X="0" H="10" Y="400" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S L="29" o="324650" H="10" X="138" Y="335" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S L="28" o="324650" H="10" X="207" Y="267" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S L="33" o="324650" H="10" X="115" Y="104" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S L="21" o="324650" H="10" X="250" Y="180" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="324650" H="10" X="241" Y="364" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="324650" H="10" X="191" Y="152" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S L="31" o="324650" H="10" X="486" Y="254" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S L="33" o="324650" H="10" X="319" Y="238" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S L="18" o="324650" H="10" X="123" Y="235" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="31" o="324650" X="674" Y="259" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="31" o="324650" X="408" Y="171" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="31" o="324650" X="578" Y="322" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="31" o="324650" X="322" Y="117" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="18" o="324650" X="738" Y="189" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="18" o="324650" X="657" Y="375" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="18" o="324650" X="563" Y="197" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="33" o="324650" X="658" Y="105" T="13" H="10" /><S L="18" o="324650" X="507" H="10" Y="151" T="13" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="18" o="324650" H="10" Y="101" T="13" X="575" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="35" Y="56" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="754" Y="72" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="45" Y="222" T="13" H="10" /></S><D><DS Y="305" X="392" /></D><O /></Z></C>',
    '<C><P F="1" /><Z><S><S L="801" H="21" X="401" Y="390" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" H="31" X="268" Y="245" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" X="413" H="31" Y="245" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" H="31" X="561" Y="244" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" X="342" H="31" Y="173" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" H="31" X="492" Y="173" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" X="419" H="31" Y="105" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" H="31" X="52" Y="315" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" X="749" H="31" Y="316" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="480" X="406" H="35" Y="317" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" H="31" X="52" Y="241" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" X="51" H="31" Y="170" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" H="31" X="50" Y="98" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" X="749" H="31" Y="245" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" H="31" X="748" Y="170" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" X="748" H="31" Y="94" T="0" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="363" X="404" /></D><O /></Z></C>',
    '<C><P F="2" /><Z><S><S L="55" H="15" X="575" Y="392" T="2" P="0,0,0,1.2,0,0,0,0" /><S L="32" H="406" X="17" Y="201" T="8" P="0,0,0.3,0.2,0,0,0,0" /><S L="211" H="22" X="106" Y="393" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="205" H="34" X="500" Y="407" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="104" H="44" X="706" Y="400" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="32" H="30" X="17" Y="336" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="32" X="17" H="30" Y="274" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="32" H="30" X="16" Y="209" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="32" X="17" H="30" Y="146" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="61" H="59" X="400" Y="267" T="10" P="0,0,0.3,0,-40,0,0,0" /><S L="61" X="446" H="59" Y="229" T="10" P="0,0,0.3,0,-40,0,0,0" /><S L="107" H="63" X="343" Y="277" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="61" H="59" X="301" Y="405" T="10" P="0,0,0.3,0,-40,0,0,0" /><S L="61" X="342" H="59" Y="111" T="10" P="0,0,0.3,0,-40,0,0,0" /><S L="38" H="189" X="343" Y="105" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="44" H="46" X="244" Y="176" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="44" X="244" H="46" Y="81" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="44" H="46" X="444" Y="84" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="165" H="40" X="718" Y="272" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="250" X="780" H="40" Y="127" T="10" P="0,0,0.3,0,-90,0,0,0" /><S L="174" H="23" X="87" Y="79" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="107" H="25" X="163" Y="272" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="21" H="344" X="120" Y="172" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="21" H="21" X="243" Y="339" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="44" X="563" H="46" Y="208" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="44" H="46" X="561" Y="118" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="44" X="659" H="46" Y="117" T="10" P="0,0,0.3,0,0,0,0,0" /></S><D><DS Y="372" X="18" /></D><O /></Z></C>',
    '<C><P F="2" A="" /><Z><S><S L="801" X="400" H="25" Y="387" T="17" P="0,0,0.3,0.2,0,0,0,0" /></S><D><P P="0,0" Y="379" T="183" X="758" /><P X="539" Y="378" T="183" P="0,0" /><DS Y="363" X="297" /><P X="759" Y="374" T="69" P="0,0" /><P X="401" Y="374" T="68" P="0,0" /><P X="346" Y="375" T="67" P="0,0" /><P X="411" Y="325" T="75" P="0,0" /><P X="401" Y="319" T="66" P="0,0" /><P X="464" Y="374" T="67" P="0,1" /><P P="0,0" Y="335" T="75" X="391" /><P X="402" Y="335" T="70" P="0,0" /><P X="80" Y="63" T="162" P="0,0" /><P X="623" Y="127" T="162" P="0,0" /><P X="724" Y="275" T="163" P="0,0" /><P X="38" Y="375" T="183" P="0,0" /><P P="0,0" Y="376" T="183" X="119" /><P X="185" Y="378" T="183" P="0,0" /><P P="0,0" Y="557" T="183" X="482" /><P X="522" Y="557" T="183" P="0,0" /><P P="0,0" Y="378" T="183" X="262" /><P P="0,0" Y="377" T="183" X="614" /><P X="692" Y="377" T="183" P="0,0" /></D><O /></Z></C>'
}
local players= {}
local cannons= {}
local ghost
local lastMap
local distance= function(x1, y1, x2, y2)
    local cO= math.abs(x1 - x2)
    local cA= math.abs(y1 - y2)
    return math.sqrt(cO ^ 2 + cA ^ 2)
end
local newGhost= function()
    ghost= Ghost:new(300, 200, 0, 0)
end
local getPlayersAlive= function ()
    local alive= 0
    for pos in next, players do
        if players[pos].alive then
            alive= alive + 1
        end
    end
    return alive
end
local sort= function()
    local copy= players
    for pos in next, copy do
        if copy[pos + 1] then
            if copy[pos].points< copy[pos + 1].points then
                local A= copy[pos]
                local B= copy[pos + 1]
                copy[pos]= B
                copy[pos + 1]= A
            end
        end
    end
    players= copy
end
eventNewPlayer= function(player)
    players[#players + 1]= {
        name= player,
        points= 0,
        alive= false,
        LBOpenned= false
    }
    if not gaming then
        tfm.exec.respawnPlayer(player)
    end
end
eventTextAreaCallback= function(_, player)
    for pos in next, players do
        if players[pos].name== player then
            if not players[pos].LBOpenned then
                ui.removeTextArea(-5, player)
                players[pos].LBOpenned= true
            else
                ui.addTextArea(-5, "<a href='event:open'>Leaderboard ></a>", player, 20, 30, nil, nil, 0x555555, 0x555555, 1, true)
                players[pos].LBOpenned= false
            end
            break
        end
    end
end
eventPlayerDied= function(player)
    if gaming then
        for pos in next, players do
            if players[pos].name== player then
                players[pos].alive= false
            end
        end
    end
end
eventPlayerLeft= function(player)
    for pos in ipairs(players) do
        if players[pos].name== player then
            table.remove(players, pos)
        end
    end
end
eventLoop= function()
    local leaderboard="<p align='center'><font color='#FFFFFF'>Leaderboard</font><br/><br/>"
    sort()
    for pos in ipairs(cannons) do
        cannons[pos].count= cannons[pos].count + 500
        if cannons[pos].count>= 5000 then
            tfm.exec.removeObject(cannons[pos].id)
            table.remove(cannons, pos)
        end
    end
    for pos in next, players do
        if pos>= 5 then break end
        leaderboard= leaderboard..players[pos].name.." - "..players[pos].points.."pts<br/>"
    end
    leaderboard= leaderboard.."</p><a href='event:close'><p align='center'><font color='#FF6677'>Fechar</font></p></font>"
    for pos in next, players do
        if players[pos].LBOpenned then
            ui.addTextArea(-3, leaderboard, players[pos].name, 20, 30, 200, 120, 0x888888, 0x555555, 0.9, true)
        else
            ui.removeTextArea(-3, players[pos].name)
        end
    end
    if #players>= 2 then
        if gaming then
            local playersAlive= getPlayersAlive()
            ghost:draw()
            for pos in next, players do
                if distance(tfm.get.room.playerList[players[pos].name].x + 15, tfm.get.room.playerList[players[pos].name].y + 15, ghost.x + 25, ghost.y + 25)<= 75 and ghost.await>= 10000 then
                    tfm.exec.killPlayer(players[pos].name)
                    break
                end
            end
            if playersAlive== 1 then
                for pos in next, players do
                    if players[pos].alive then
                        players[pos].points= players[pos].points + 10
                        ui.addTextArea(-4, "<p align='center'><font size='20' color='#888888'><b>"..players[pos].name.."</b> wins!</font></p>", nil, 300, 50, 250, nil, 0xDDDDDD, 0xDDDDDD, 1, true)
                        break
                    end
                end
                gaming= false
                tfm.exec.newGame(hub)
                ui.setMapName("Escape from ghost!")
                lastMap= hub
            elseif playersAlive== 0 then
                ui.addTextArea(-4, "<p align='center'><font size='20' color='#FF6677'>Tie!</font></p>", nil, 300, 50, 250, nil, 0xDDDDDD, 0xDDDDDD, 1, true)
                gaming= false
                tfm.exec.newGame(hub)
                ui.setMapName("Escape from ghost!")
                lastMap= hub
            end
            ghost.End= true
        else
            time= time + 500
            if ghost.End then
                for pos= 0, 107 do
                    ui.removeTextArea(pos, nil)
                end
                ghost.End= false
            end
            if time>= 10000 and time< 21000 then
                ui.removeTextArea(-2, nil)
                ui.removeTextArea(-4, nil)
                ui.addTextArea(-1, "<font size='30' color='#66FF66'><p align='center'>"..(math.floor((20000 - time) / 1000)).."</p></font>", nil, 350, 50, 60, 40, 0xFFFFFF, 0xFFFFFF, 1, true)
            end
            if time> 20000 then
                local map= maps[math.random(1, #maps)]
                lastMap= map
                ui.removeTextArea(-1, nil)
                tfm.exec.newGame(map)
                ui.setMapName("Escape from ghost!")
                time= 0
                gaming= true
                newGhost()
                for pos in next, players do
                    players[pos].alive= true
                end
            end
        end
    else
        ui.addTextArea(-2, "<p align='center'><font color='#55DD55' size='20'>Waiting for players...</font><br/><br/><font color='#111111' size='16'>1/2</font></p>", nil, 300, 50, 200, nil, 0xDDDDDD, 0xDDDDDD, 1, true)
        if lastMap~= hub then
            tfm.exec.newGame(hub)
            ui.setMapName("Escape from ghost!")
            lastMap= hub
            ghost.End= true
        end
    end
end
do
    do
        Ghost.__index= Ghost
        function Ghost:new(x, y, velX, velY)
            return setmetatable({
                x= x,
                y= y,
                velX= velX,
                velY= velY,
                target= players[math.random(1, #players)].name,
                mode="normal",
                throw= 0,
                count= 0,
                multiAttack= 0,
                plasmaData= {
                    empty= true,
                    data= {}
                },
                new_Target= 0,
                await= 0,
                End= false
            }, self)
        end
        function Ghost:draw()
            self.await= self.await + 500
            if self.await>= 10000 then
                local alive
                self.x= self.x + self.velX
                self.y= self.y + self.velY
                self.new_Target= self.new_Target + 500
                for pos in next, players do
                    if players[pos].name== self.target then alive= players[pos].alive end
                end
                if self.new_Target>= 30000 or not alive then
                    self.new_Target= 0
                    self:newTarget()
                end
                for pos= 0, 7 do
                    ui.removeTextArea(pos, nil)
                end
                if self.velX> 0 then
                    ui.addTextArea(0, "", nil, self.x, self.y, 50, 50, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(1, "", nil, self.x - 10, self.y + 40, 20, 20, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(2, "", nil, self.x - 5, self.y + 30, 20, 20, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(3, "", nil, self.x - 15, self.y + 20, 20, 20, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(4, "", nil, self.x - 12, self.y + 10, 20, 20, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(5, "", nil, self.x - 30, self.y + 45, 20, 20, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(6, "", nil, self.x - 40, self.y + 50, 20, 20, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(7, "", nil, self.x + 40, self.y + 5, 5, 5, 0x111111, 0x111111, 1, true)
                    for pos= 1, 40 do
                        local x= math.random(self.x, self.x + 60)
                        local y= math.random(self.y, self.y + 60)
                        tfm.exec.displayParticle(4, x, y, -1, 0, 0, 0)
                    end
                else
                    ui.addTextArea(0, "", nil, self.x, self.y, 50, 50, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(1, "", nil, self.x + 51, self.y + 40, 20, 20, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(2, "", nil, self.x + 50, self.y + 30, 20, 20, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(3, "", nil, self.x + 60, self.y + 20, 20, 20, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(4, "", nil, self.x + 57, self.y + 10, 20, 20, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(5, "", nil, self.x + 75, self.y + 45, 20, 20, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(6, "", nil, self.x + 85, self.y + 50, 20, 20, 0xFFFFFF, 0xFFFFFF, 0.8, true)
                    ui.addTextArea(7, "", nil, self.x + 5, self.y + 5, 5, 5, 0x111111, 0x111111, 1, true)
                    for pos= 1, 40 do
                        local x= math.random(self.x, self.x + 60)
                        local y= math.random(self.y, self.y + 60)
                        tfm.exec.displayParticle(4, x, y, 1, 0, 0, 0)
                    end
                end
                if self.mode=="normal" then
                    local cos, sen, player, ang
                    self.throw= self.throw + 500
                    self.count= self.count + 500
                    player= tfm.get.room.playerList[self.target]
                    ang= math.atan2(self.y - player.y, self.x - player.x)
                    cos= math.cos(ang)
                    sen= math.sin(ang)
                    self.velX= (cos * 25) * -1
                    self.velY= (sen * 25) * -1
                    if self.throw>= 1500 then
                        local Cos, Sen
                        local Ang= math.atan2(player.y - self.y, player.x - self.x)
                        local cannon= {
                            id= 0,
                            count= 0
                        }
                        Cos= math.cos(Ang)
                        Sen= math.sin(Ang)
                        Ang= math.deg(Ang)
                        Ang= Ang + 90
                        if Ang> 360 then Ang= Ang - 360 end
                        self.throw= 0
                        if self.velX> 0 then
                            cannon.id= tfm.exec.addShamanObject(1701, self.x + 45, self.y, Ang, 10 * Cos, 10 * Sen)
                        else
                            cannon.id= tfm.exec.addShamanObject(1701, self.x + 5, self.y, Ang, 10 * Cos, 10 * Sen)
                        end
                        cannons[#cannons + 1]= cannon
                        if self.count>= 90000 then
                            self.count= 0
                            self.mode="plasma"
                        end
                    end
                elseif self.mode=="plasma" then
                    self.velX= math.random(-5, 5)
                    self.velY= math.random(-5, 5)
                    if self.plasmaData.empty then
                        for pos= 1, 6 do
                            self.plasmaData.data[pos]= {
                                x= math.random(40, 760),
                                y= math.random(60, 360)
                            }
                        end
                        self.plasmaData.empty= false
                    end
                    for pos, data in next, self.plasmaData.data do
                        for k= 1, 10 do
                            local colors= {0x66FF66, 0x6656FF}
                            local color= colors[math.random(2)]
                            local x= math.random(data.x - 20, data.x + 20)
                            local y= math.random(data.y - 20, data.y + 20)
                            ui.addTextArea((7 + k) * pos, "", nil, x, y, math.random(5, 10), math.random(5, 10), color, color, 0.9)
                        end
                    end
                    self.multiAttack= self.multiAttack + 500
                    if self.multiAttack>= 8000 then
                        for _, data in next, self.plasmaData.data do
                            for k= 1, 2 do
                                local cannon= tfm.exec.addShamanObject(1701, data.x + ((k - 1) * 10), data.y - 50, 180, 0, 10)
                                cannons[#cannons + 1]= {
                                    id= cannon,
                                    count= 0
                                }
                            end
                        end
                        self.multiAttack= 0
                        self.mode="normal"
                        self.plasmaData.empty= true
                        self.plasmaData.data= {}
                    end
                end
            end
        end
        function Ghost:newTarget()
            while (true) do
                local target= players[math.random(1, #players)].name
                local alive
                for pos in next, players do
                    if players[pos].name== target then alive= players[pos].alive end
                end
                if alive then
                    self.target= target
                    break
                end
            end
        end
        function Ghost:setVel(velX, velY)
            self.velX= velX
            self.velY= velY
        end
    end
    for _, data in next, {"AutoNewGame", "AutoShaman", "MortCommand", "AutoTimeLeft", "AfkDeath"} do
        tfm.exec["disable"..data]()
    end
    table.foreach(tfm.get.room.playerList, eventNewPlayer)
    newGhost()
    for pos in next, players do
        ui.addTextArea(-5, "<a href='event:open'>Leaderboard ></a>", players[pos].name, 20, 30, nil, nil, 0x555555, 0x555555, 1, true)
    end
    tfm.exec.newGame(hub)
    lastMap= hub
	ui.setMapName("Escape from ghost!")
end
