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
 iCal   ��  ��   9 m     P Pnull     ߀�� O�GrowlHelperApp.appL��� 7�������� �p   )       �(�K� ��� �GRRR   alis    �  WideBoy                    ��.1H+   O�GrowlHelperApp.app                                              O{�&݇        ����  	                build     ��.1      �&݇     O� N�> /� /� ��  |  DWideBoy:Users:diggory:Code:OpenSource:growl:build:GrowlHelperApp.app  &  G r o w l H e l p e r A p p . a p p    W i d e B o y  <Users/diggory/Code/OpenSource/growl/build/GrowlHelperApp.app  /    ��   7  Q R Q l   ������  ��   R  S�� S I   1���� T
�� .notifygrnull��� ��� null��   T �� U V
�� 
name U l 	   ! W�� W m     ! X X  In-Script Notification   ��   V �� Y Z
�� 
titl Y l 	 " # [�� [ m   " # \ \  Please Wait   ��   Z �� ] ^
�� 
desc ] l 	 & ) _�� _ m   & ) ` ` + %Gathering today's events from iCal...   ��   ^ �� a��
�� 
appl a m   * - b b - 'AppleScript iCal today's Event Notifier   ��  ��   2 m      P��   /  c d c l     ������  ��   d  e f e l     ������  ��   f  g h g l     ������  ��   h  i j i l     ������  ��   j  k l k l     �� m��   m  	Gather today's events    l  n o n l  3� p�� p O   3� q r q k   9� s s  t u t r   9 B v w v I  9 >������
�� .misccurdldt    ��� null��  ��   w o      ���� 0 now   u  x y x r   C L z { z 2   C H��
�� 
wres { o      ���� 0 everycalendar everyCalendar y  | } | l  M M������  ��   }  ~  ~ r   M W � � � c   M S � � � J   M O����   � m   O R��
�� 
list � o      ���� 0 currentevents currentEvents   � � � Y   X ��� � ��� � k   m � �  � � � r   m y � � � n   m u � � � 4   p u�� �
�� 
cobj � o   s t���� 0 i   � o   m p���� 0 everycalendar everyCalendar � o      ���� 0 thiscal thisCal �  � � � l  z z������  ��   �  ��� � O   z � � � k   � � �  � � � r   � � � � � 2   � ���
�� 
wrev � o      ���� 0 
everyevent 
everyEvent �  ��� � Y   � ��� � ��� � k   � � �  � � � r   � � � � � n   � � � � � 4   � ��� �
�� 
cobj � o   � ����� 0 ii   � o   � ����� 0 
everyevent 
everyEvent � o      ���� 0 	thisevent 	thisEvent �  ��� � O   � � � � k   � � �  � � � l  � �������  ��   �  ��� � Z   � � ����� � A   � � � � � 1   � ���
�� 
wr1s � o   � ����� 0 now   � Z   � � ����� � ?   � � � � � 1   � ���
�� 
wr5s � o   � ����� 0 now   � k   � � �  � � � l  � ��� ���   � # 	This checking is pretty bad     �  � � � l  � ��� ���   � B <    events today that have already elapsed are not included.    �  � � � l  � �������  ��   �  � � � l  � ��� ���   � $ 	log ("CURRENT EVENT!")							    �  � � � r   � � � � � c   � � � � � K   � � � � �� � ��� 0 
eventtitle 
eventTitle � n   � � � � � 1   � ���
�� 
wr11 � o   � ����� 0 	thisevent 	thisEvent � �� ����� $0 eventdescription eventDescription � n   � � � � � 1   � ���
�� 
wr12 � o   � ����� 0 	thisevent 	thisEvent��   � m   � ���
�� 
reco � o      ���� 0 myrecord myRecord �  � � � r   � � � � � c   � � � � � J   � � � �  ��� � o   � ����� 0 myrecord myRecord��   � m   � ���
�� 
list � o      ���� 0 newlist newList �  ��� � r   � � � � b   �  � � � o   � ����� 0 currentevents currentEvents � o   � ����� 0 newlist newList � o      ���� 0 currentevents currentEvents��  ��  ��  ��  ��  ��   � o   � ����� 0 	thisevent 	thisEvent��  �� 0 ii   � m   � �����  � n   � � � � � m   � ���
�� 
nmbr � n  � � � � � 2  � ���
�� 
cobj � o   � ����� 0 
everyevent 
everyEvent��  ��   � o   z }���� 0 thiscal thisCal��  �� 0 i   � m   [ \����  � n   \ h � � � m   c g�
� 
nmbr � n  \ c � � � 2  _ c�~
�~ 
cobj � o   \ _�}�} 0 everycalendar everyCalendar��   �  � � � l �|�{�|  �{   �  � � � l �z�y�z  �y   �  � � � l �x ��x   �  	Show the events.    �  � � � Y  � ��w � ��v � k  .� � �  � � � r  .: � � � n  .6 � � � 4  16�u �
�u 
cobj � o  45�t�t 0 i   � o  .1�s�s 0 currentevents currentEvents � o      �r�r "0 thiseventrecord thisEventRecord �  � � � Q  ;X � � � � r  >I � � � n  >E   o  AE�q�q 0 
eventtitle 
eventTitle o  >A�p�p "0 thiseventrecord thisEventRecord � o      �o�o "0 theeventsummary theEventSummary � R      �n�m�l
�n .ascrerr ****      � ****�m  �l   � r  QX m  QT  
no summary    o      �k�k "0 theeventsummary theEventSummary �  l YY�j�i�j  �i    Q  Yv	
	 r  \g n  \c o  _c�h�h $0 eventdescription eventDescription o  \_�g�g "0 thiseventrecord thisEventRecord o      �f�f *0 theeventdescription theEventDescription
 R      �e�d�c
�e .ascrerr ****      � ****�d  �c   r  ov m  or  no description    o      �b�b *0 theeventdescription theEventDescription  l ww�a�`�a  �`   �_ O w� l 	{��^ I {��]�\
�] .notifygrnull��� ��� null�\   �[
�[ 
name l 	}��Z m  }�  Today's Events   �Z   �Y
�Y 
titl l 	�� �X  o  ���W�W "0 theeventsummary theEventSummary�X   �V!"
�V 
desc! l 	��#�U# o  ���T�T *0 theeventdescription theEventDescription�U  " �S$�R
�S 
appl$ m  ��%% - 'AppleScript iCal today's Event Notifier   �R  �^   m  wx P�_  �w 0 i   � m  �Q�Q  � n  )&'& m  $(�P
�P 
nmbr' n $()( 2  $�O
�O 
cobj) o   �N�N 0 currentevents currentEvents�v   � *+* l ���M�L�M  �L  + ,-, l ���K�J�K  �J  - ./. l ���I0�I  0 # 	explain if there aren't any:   / 121 l ���H�G�H  �G  2 343 Z  ��56�F�E5 =  ��787 l ��9�D9 n  ��:;: m  ���C
�C 
nmbr; n ��<=< 2 ���B
�B 
cobj= o  ���A�A 0 currentevents currentEvents�D  8 m  ���@�@  6 k  ��>> ?@? O ��ABA l 	��C�?C I ���>�=D
�> .notifygrnull��� ��� null�=  D �<EF
�< 
nameE l 	��G�;G m  ��HH  In-Script Notification   �;  F �:IJ
�: 
titlI l 	��K�9K m  ��LL  	No Events   �9  J �8MN
�8 
descM l 	��O�7O m  ��PP > 8There are no events in iCal today - go outside and play!   �7  N �6Q�5
�6 
applQ m  ��RR - 'AppleScript iCal today's Event Notifier   �5  �?  B m  �� P@ S�4S l ���3�2�3  �2  �4  �F  �E  4 T�1T l ���0�/�0  �/  �1   r m   3 6UU�null     ߀��  ^iCal.appP   P� �0    ���`U�� �0                 e��(-l���  wrbt   alis    6  WideBoy                    ��.1H+    ^iCal.app                                                         ���        ����  	                Applications    ��.1      ��      ^  WideBoy:Applications:iCal.app     i C a l . a p p    W i d e B o y  Applications/iCal.app   / ��  ��   o VWV l     �.�-�.  �-  W X�,X l     �+�*�+  �*  �,       �)YZ�)  Y �(
�( .aevtoappnull  �   � ****Z �'[�&�%\]�$
�' .aevtoappnull  �   � ****[ k    �^^  .__  n�#�#  �&  �%  \ �"�!�" 0 i  �! 0 ii  ] 8 P B D� � I��� O��� X� \� ` b�U������������
�	��������� ����������%HLPR�   0 myallnoteslist myAllNotesList
� 
appl
� 
anot
� 
dnot
� 
iapp� 
� .registernull��� ��� null
� 
name
� 
titl
� 
desc
� .notifygrnull��� ��� null
� .misccurdldt    ��� null� 0 now  
� 
wres� 0 everycalendar everyCalendar
� 
list� 0 currentevents currentEvents
� 
cobj
� 
nmbr� 0 thiscal thisCal
� 
wrev� 0 
everyevent 
everyEvent�
 0 	thisevent 	thisEvent
�	 
wr1s
� 
wr5s� 0 
eventtitle 
eventTitle
� 
wr11� $0 eventdescription eventDescription
� 
wr12� 
� 
reco� 0 myrecord myRecord�  0 newlist newList�� "0 thiseventrecord thisEventRecord�� "0 theeventsummary theEventSummary��  ��  �� *0 theeventdescription theEventDescription�$�� /� ��lvE�O*��������� UO*����a a �a � UOa �*j E` O*a -E` Ojva &E` O �k_ a -a ,Ekh  _ a �/E` O_  �*a -E` O �k_ a -a ,Ekh _ a �/E`  O_   \*a !,_  O*a ",_  ?a #_  a $,a %_  a &,a 'a (&E` )O_ )kva &E` *O_ _ *%E` Y hY hU[OY��U[OY�TO ~k_ a -a ,Ekh  _ a �/E` +O _ +a #,E` ,W X - .a /E` ,O _ +a %,E` 0W X - .a 1E` 0O� *�a 2�_ ,a _ 0�a 3� U[OY��O_ a -a ,j  #� *�a 4�a 5a a 6�a 7� UOPY hOPUascr  ��ޭ