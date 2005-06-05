FasdUAS 1.101.10   ��   ��    k             l     �� ��    Q K	An applescript that shows today's events from iCal as growl notifications.       	  l     �� 
��   
 a [	The script shows how to register and use multiple types of notifications from Applescript:    	     l     ������  ��        l     �� ��     		"Today's Events"         l     �� ��     			and         l     �� ��    ! 		"In-Script Notifications"         l     �� ��    D >			are the two notification types that this script registers.          l     �� ��    @ : 			The types of notification are separated functionally.          l     �� ��    | v 			So the user can disable the first informational note from the prefpane without disabling the main notifications.            l     �� !��   ! t n--------------------------------------------------------------------------------------------------------------       " # " l     �� $��   $ t n--------------------------------------------------------------------------------------------------------------    #  % & % l     ������  ��   &  ' ( ' l     ������  ��   (  ) * ) l     ������  ��   *  + , + l     �� -��   - A ;	Register with growl and show the "gathering" notification.    ,  . / . l    2 0�� 0 O     2 1 2 1 k    1 3 3  4 5 4 l   ������  ��   5  6 7 6 O     8 9 8 k     : :  ; < ; r     = > = J     ? ?  @ A @ m    	 B B  Today's Events    A  C�� C m   	 
 D D  In-Script Notification   ��   > o      ����  0 myallnoteslist myAllNotesList <  E�� E I   ���� F
�� .registernull��� ��� null��   F �� G H
�� 
appl G m     I I - 'AppleScript iCal today's Event Notifier    H �� J K
�� 
anot J o    ����  0 myallnoteslist myAllNotesList K �� L M
�� 
dnot L o    ����  0 myallnoteslist myAllNotesList M �� N��
�� 
iapp N m     O O 
 iCal   ��  ��   9 m     P P2null     ߀�� L�GrowlHelperApp.appP��(����    x�   )       ��(�|�����zGRRR   alis    �  Macintosh HD               �g�H+   L�GrowlHelperApp.app                                              L��ȞV        ����  	                	Resources     �f��      �Ȃ6     L� L�  L�� D  D  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��   7  Q R Q l   ������  ��   R  S�� S I   1���� T
�� .notifygrnull��� ��� null��   T �� U V
�� 
name U l 	   ! W�� W m     ! X X  In-Script Notification   ��   V �� Y Z
�� 
titl Y l 	 " # [�� [ m   " # \ \  Please Wait   ��   Z �� ] ^
�� 
desc ] l 	 & ) _�� _ m   & ) ` ` ^ XGathering today's events from iCal... (n.b. Events which are repeats will not be shown!)   ��   ^ �� a��
�� 
appl a m   * - b b - 'AppleScript iCal today's Event Notifier   ��  ��   2 m      P��   /  c d c l     ������  ��   d  e f e l  3 < g�� g r   3 < h i h I  3 8������
�� .misccurdldt    ��� null��  ��   i o      ���� 0 now  ��   f  j k j l  = L l�� l r   = L m n m \   = H o p o o   = @���� 0 now   p l  @ G q�� q n   @ G r s r 1   C G��
�� 
time s o   @ C���� 0 now  ��   n o      ���� 0 thismorning thisMorning��   k  t u t l  M T v�� v I  M T�� w��
�� .ascrcmnt****      � **** w l  M P x�� x o   M P���� 0 thismorning thisMorning��  ��  ��   u  y z y l  U d {�� { r   U d | } | \   U ` ~  ~ [   U ^ � � � o   U X���� 0 thismorning thisMorning � ]   X ] � � � m   X Y����  � 1   Y \��
�� 
days  m   ^ _����  } o      ���� 0 thisevening thisEvening��   z  � � � l  e l ��� � I  e l�� ���
�� .ascrcmnt****      � **** � l  e h ��� � o   e h���� 0 thisevening thisEvening��  ��  ��   �  � � � l     ������  ��   �  � � � l     �� ���   �  	Gather today's events    �  � � � l  mB ��� � O   mB � � � k   sA � �  � � � l  s s������  ��   �  � � � r   s } � � � c   s y � � � J   s u����   � m   u x��
�� 
list � o      ���� 0 currentevents currentEvents �  � � � X   ~z ��� � � O   �u � � � X   �t ��� � � O   �o � � � k   �n � �  � � � l  � ��� ���   � $ 	Catch events that start today    �  � � � r   � � � � � m   � ���
�� boovfals � o      ����  0 eventiscurrent eventIsCurrent �  � � � Z   � � � ����� � F   � � � � � l  � � ��� � @   � � � � � 1   � ���
�� 
wr1s � o   � ����� 0 thismorning thisMorning��   � l  � � ��� � B   � � � � � 1   � ���
�� 
wr1s � o   � ����� 0 thisevening thisEvening��   � r   � � � � � m   � ���
�� boovtrue � o      ����  0 eventiscurrent eventIsCurrent��  ��   �  � � � l  � �������  ��   �  � � � l  � ��� ���   � F @	Catch events that started before today, but have not yet ended.    �  � � � Z   � � ����� � F   � � � � � l  � � ��� � @   � � � � � 1   � ���
�� 
wr5s � o   � ����� 0 now  ��   � l  � � ��� � B   � � � � � 1   � ���
�� 
wr1s � o   � ����� 0 thismorning thisMorning��   � r   � � � � m   � ���
�� boovtrue � o      ����  0 eventiscurrent eventIsCurrent��  ��   �  � � � l ������  ��   �  ��� � Z  n � ����� � l  ��� � =  � � � o  ����  0 eventiscurrent eventIsCurrent � m  ��
�� boovtrue��   � k  j � �  � � � I �� ���
�� .ascrcmnt****      � **** � l  ��� � m   � �  CURRENT EVENT!   ��  ��   �  � � � r  ! � � � 1  ��
�� 
wr1s � o      ���� 0 thestart theStart �  � � � r  "- � � � n  ") � � � 1  %)��
�� 
tstr � o  "%�� 0 thestart theStart � o      �~�~ 0 thestarttime theStartTime �  � � � r  .P � � � c  .L � � � K  .H � � �} � ��} 0 
eventtitle 
eventTitle � n  16 � � � 1  26�|
�| 
wr11 � o  12�{�{ 0 	thisevent 	thisEvent � �z � ��z $0 eventdescription eventDescription � n  9> � � � 1  :>�y
�y 
wr12 � o  9:�x�x 0 	thisevent 	thisEvent � �w ��v�w 0 	starttime 	startTime � o  AD�u�u 0 thestarttime theStartTime�v   � m  HK�t
�t 
reco � o      �s�s 0 myrecord myRecord �  � � � r  Q^ � � � c  QZ � � � J  QV � �  ��r � o  QT�q�q 0 myrecord myRecord�r   � m  VY�p
�p 
list � o      �o�o 0 newlist newList �  ��n � r  _j   b  _f o  _b�m�m 0 currentevents currentEvents o  be�l�l 0 newlist newList o      �k�k 0 currentevents currentEvents�n  ��  ��  ��   � o   � ��j�j 0 	thisevent 	thisEvent�� 0 	thisevent 	thisEvent � 2   � ��i
�i 
wrev � o   � ��h�h 0 thiscal thisCal�� 0 thiscal thisCal � 2   � ��g
�g 
wres �  l {{�f�e�f  �e    l {{�d�d    	Show the events.    	
	 l {{�c�b�c  �b  
  Z  {��a�` l {��_ =  {� n  {� m  ���^
�^ 
nmbr n {� 2 ~��]
�] 
cobj o  {~�\�\ 0 currentevents currentEvents m  ���[�[  �_   O �� l 	���Z I ���Y�X
�Y .notifygrnull��� ��� null�X   �W
�W 
name l 	���V m  ��  In-Script Notification   �V   �U
�U 
titl l 	�� �T  m  ��!!  No iCal events today   �T   �S"#
�S 
desc" l 	��$�R$ m  ��%%  Go outside and play!   �R  # �Q&�P
�Q 
appl& m  ��'' - 'AppleScript iCal today's Event Notifier   �P  �Z   m  �� P�a  �`   ()( l ���O�N�O  �N  ) *+* Y  �?,�M-.�L, k  �:// 010 r  ��232 n  ��454 4  ���K6
�K 
cobj6 o  ���J�J 0 i  5 o  ���I�I 0 currentevents currentEvents3 o      �H�H "0 thiseventrecord thisEventRecord1 787 Q  ��9:;9 r  ��<=< l ��>�G> b  ��?@? b  ��ABA n  ��CDC o  ���F�F 0 
eventtitle 
eventTitleD o  ���E�E "0 thiseventrecord thisEventRecordB m  ��EE 	  -    @ n  ��FGF o  ���D�D 0 	starttime 	startTimeG o  ���C�C "0 thiseventrecord thisEventRecord�G  = o      �B�B "0 theeventsummary theEventSummary: R      �A�@�?
�A .ascrerr ****      � ****�@  �?  ; r  ��HIH b  ��JKJ m  ��LL  no summary -    K n  ��MNM o  ���>�> 0 	starttime 	startTimeN o  ���=�= "0 thiseventrecord thisEventRecordI o      �<�< "0 theeventsummary theEventSummary8 OPO l   �;�:�;  �:  P QRQ Q   STUS r  VWV n  
XYX o  
�9�9 $0 eventdescription eventDescriptionY o  �8�8 "0 thiseventrecord thisEventRecordW o      �7�7 *0 theeventdescription theEventDescriptionT R      �6�5�4
�6 .ascrerr ****      � ****�5  �4  U r  Z[Z m  \\  no description   [ o      �3�3 *0 theeventdescription theEventDescriptionR ]^] l �2�1�2  �1  ^ _�0_ O :`a` l 	"9b�/b I "9�.�-c
�. .notifygrnull��� ��� null�-  c �,de
�, 
named l 	$'f�+f m  $'gg  Today's Events   �+  e �*hi
�* 
titlh l 	(+j�)j o  (+�(�( "0 theeventsummary theEventSummary�)  i �'kl
�' 
desck l 	.1m�&m o  .1�%�% *0 theeventdescription theEventDescription�&  l �$n�#
�$ 
appln m  25oo - 'AppleScript iCal today's Event Notifier   �#  �/  a m   P�0  �M 0 i  - m  ���"�" . n  ��pqp m  ���!
�! 
nmbrq n ��rsr 2 ��� 
�  
cobjs o  ���� 0 currentevents currentEvents�L  + t�t l @@���  �  �   � m   m puu�null     ߀��  iiCal.app���֠    �P<��(����   x�   )       ��(�|�����zwrbt   alis    D  Macintosh HD               �g�H+    iiCal.app                                                        ��?Y�        ����  	                Applications    �f��      �?K�      i  "Macintosh HD:Applications:iCal.app    i C a l . a p p    M a c i n t o s h   H D  Applications/iCal.app   / ��  ��   � vwv l     ���  �  w x�x l     ���  �  �       �yz�  y �
� .aevtoappnull  �   � ****z �{��|}�
� .aevtoappnull  �   � ****{ k    B~~  .  e��  j��  t��  y��  ���  ���  �  �  | ���� 0 thiscal thisCal� 0 	thisevent 	thisEvent� 0 i  } C P B D�� I�
�	� O��� X� \� ` b��� ����������u���������������������� ���������������������������!%'��E������L��\go�  0 myallnoteslist myAllNotesList
� 
appl
�
 
anot
�	 
dnot
� 
iapp� 
� .registernull��� ��� null
� 
name
� 
titl
� 
desc
� .notifygrnull��� ��� null
� .misccurdldt    ��� null�  0 now  
�� 
time�� 0 thismorning thisMorning
�� .ascrcmnt****      � ****
�� 
days�� 0 thisevening thisEvening
�� 
list�� 0 currentevents currentEvents
�� 
wres
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
wrev��  0 eventiscurrent eventIsCurrent
�� 
wr1s
�� 
bool
�� 
wr5s�� 0 thestart theStart
�� 
tstr�� 0 thestarttime theStartTime�� 0 
eventtitle 
eventTitle
�� 
wr11�� $0 eventdescription eventDescription
�� 
wr12�� 0 	starttime 	startTime�� 
�� 
reco�� 0 myrecord myRecord�� 0 newlist newList
�� 
nmbr�� "0 thiseventrecord thisEventRecord�� "0 theeventsummary theEventSummary��  ��  �� *0 theeventdescription theEventDescription�C� /� ��lvE�O*��������� UO*����a a �a � UO*j E` O_ _ a ,E` O_ j O_ k_  kE` O_ j Oa �jva &E` O �*a -[a a  l !kh  � � �*a "-[a a  l !kh � �fE` #O*a $,_ 	 *a $,_ a %& 
eE` #Y hO*a &,_ 	 *a $,_ a %& 
eE` #Y hO_ #e  _a 'j O*a $,E` (O_ (a ),E` *Oa +�a ,,a -�a .,a /_ *a 0a 1&E` 2O_ 2kva &E` 3O_ _ 3%E` Y hU[OY�=U[OY�O_ a  -a 4,j  !� *�a 5�a 6a a 7�a 8� UY hO �k_ a  -a 4,Ekh _ a  �/E` 9O _ 9a +,a :%_ 9a /,%E` ;W X < =a >_ 9a /,%E` ;O _ 9a -,E` ?W X < =a @E` ?O� *�a A�_ ;a _ ?�a B� U[OY��OPU ascr  ��ޭ