FasdUAS 1.101.10   ��   ��    k             l      �� ��   	�	�
* This script requires Growl. You can download Growl here: http://growl.info
* Once you have installed Growl, you can save this script as an application,
* remember to check the "Stays Open" option before saving.
* Then double-click the new application and enjoy.
*
* Comments and ideas to  piti118@hotmail.com
* Sorry, If I made the code looks dirty, This is the
* first time I learn and write applescript
*Modified by Piti Ongmongkolkul May 11 05
*--add registerations in growl so that user can customize which message to receive
*--add bonjour
*--use merge sort O(n log(n))instead of the old 2n^2 algo
*--complete overhaul code
* Modified by Piti Ongmongkolkul May 5
* -- fix aim where some user does not have display picture and caused the program not to show notification
* -- display picture is now available for jabber --> you need to add it manually via address book
* just right click the name and get info
* -- fix(again) bug where the program sends every username to this growl.(Reported by benjamindaines)
* -- when aim buddy went away. It displays name(away) followed by status message 
* Modified by Piti Ongmongkolku May 4
* -- as pointed out by ben on growl forum
* this program cause ichat to reopen
* -- case the program tell iChat while it's closed caused it to reopen 
* -- fix: add semaphores
* -- also add semaphores for growl
* Modified by Piti Ongmongkolkul May 3 05
* -- correct behavior for aim account
* --display account name
* --display picture weeeeee
* -- huge code overhaul
* Modified by Piti Ongmongkolkul May 2 05
* -- put try and on error on every module
* 	to catch "connection error" when shutdown(hopefully)(I hate racing problem :( )
* -- fix show-everybody-bug when the program is
* 	launched after ichat or when the user log off and log in again
* 	by adding a variable userWasOnline variable and isJustOnline() module which will 
* 	touch userWasOnline variable and return true iff user was not online and just become online
* Modified by Piti Ongmongkolkul May 1 05 again
* --ignore work around method. Who cares when someone goes offline
* --fix bug when the user log off and log on again and send
* 	unknown status to growl.
* Modified by Piti Ongmongkolkul May 1 05
* --change theName from name to status id
* 	to account for msn messenger display name
* 	(use jabber msn transport)
* --workaround  (blank) went offline bug
* 	this happened because when the user is offline
* 	the status is set to blank. work around was done
* 	by using name instead of status in the case where
* 	the user went offline 
       	  l     ������  ��   	  
  
 j     �� �� 0 idletime idleTime  m     ����       l          j    �� �� 0 waitidletime waitIdleTime  m    ����   ) #wait until the list is fully loaded         j    �� �� &0 jabberservicename jabberServiceName  m        Jabber         j   	 �� ��  0 aimservicename aimServiceName  m   	 
   	 AIM         l          j    �� �� (0 bonjourservicename bonjourServiceName  m        Bonjour     % this is "Rendezvous" in Panther        !   j    �� "�� 80 jabbertransportservicename jabberTransportServiceName " m     # #  Jabber    !  $ % $ j    �� &�� (0 jabberserviceindex jabberServiceIndex & m    ����  %  ' ( ' j    �� )�� "0 aimserviceindex aimServiceIndex ) m    ����  (  * + * j    �� ,�� *0 bonjourserviceindex bonjourServiceIndex , m    ����  +  - . - j    �� /�� :0 jabbertransportserviceindex jabberTransPortServiceIndex / m    ����  .  0 1 0 j     �� 2�� 0 onlineindex onlineIndex 2 m    ����  1  3 4 3 j   ! #�� 5�� 0 	awayindex 	awayIndex 5 m   ! "����  4  6 7 6 j   $ &�� 8�� 0 	idleindex 	idleIndex 8 m   $ %����  7  9 : 9 j   ' )�� ;�� 0 idindex idIndex ; m   ' (����  :  < = < j   * ,�� >�� (0 statusmessageindex statusMessageIndex > m   * +����  =  ? @ ? j   - /�� A�� 0 statusindex statusIndex A m   - .����  @  B C B j   0 4�� D�� 0 	nameindex 	nameIndex D m   0 1����  C  E F E l      �� G��   G  property emptyData : {}    F  H I H l      �� J��   J k edata whre data is {online record, away record, idle record} and each record is {ids},{statusmessages}    I  K L K l      �� M��   M O Inote that status message record is only used for jabber transport account    L  N O N l      �� P��   P � �this code will exploit the fact that each data id is exlusive ie intersection is empty set reduce n in n square :D
 and the algorithm I used to reduce number of comparision for one kind of status I chose it to be
 the offline one    O  Q R Q l       S T S j   5 >�� U�� 0 	delaytime 	delayTime U J   5 ; V V  W X W m   5 6����   X  Y Z Y m   6 7����   Z  [ \ [ m   7 8����   \  ]�� ] m   8 9����  ��   T 2 ,delay when found that  user is not available    R  ^ _ ^ j   ? L�� `�� 0 lastlist lastList ` J   ? I a a  b c b J   ? A����   c  d e d J   A C����   e  f g f J   C E����   g  h�� h J   E G����  ��   _  i j i j   M V�� k�� 0 	wasonline 	wasOnline k J   M S l l  m n m m   M N��
�� boovfals n  o p o m   N O��
�� boovfals p  q r q m   O P��
�� boovfals r  s�� s m   P Q��
�� boovfals��   j  t u t j   W [�� v�� &0 alreadyregistered alreadyRegistered v m   W X��
�� boovfals u  w x w j   \ f�� y�� 0 newline   y I  \ c�� z��
�� .sysontocTEXT       shor z m   \ _���� 
��   x  { | { j   g m�� }�� 0 appname appName } m   g j ~ ~  iChat    |   �  j   n t�� ��� &0 aimonlineregister aimOnlineRegister � m   n q � �  Aim online status    �  � � � j   u {�� ��� "0 aimawayregister aimAwayRegister � m   u x � �  Aim away status    �  � � � j   | ��� ��� "0 aimidleregister aimIdleRegister � m   |  � �  Aim idle status    �  � � � j   � ��� ��� (0 aimofflineregister aimOfflineRegister � m   � � � �  Aim offline status    �  � � � j   � ��� ���  0 allaimregister allAimRegister � J   � � � �  � � � o   � ����� &0 aimonlineregister aimOnlineRegister �  � � � o   � ����� "0 aimawayregister aimAwayRegister �  � � � o   � ����� "0 aimidleregister aimIdleRegister �  ��� � o   � ����� (0 aimofflineregister aimOfflineRegister��   �  � � � j   � ��� ��� ,0 jabberonlineregister jabberOnlineRegister � m   � � � �  Jabber online status    �  � � � j   � ��� ��� (0 jabberawayregister jabberAwayRegister � m   � � � �  Jabber away status    �  � � � j   � ��� ��� (0 jabberidleregister jabberIdleRegister � m   � � � �  Jabber idle status    �  � � � j   � ��� ��� .0 jabberofflineregister jabberOfflineRegister � m   � � � �  Jabber Offline status    �  � � � j   � ��� ��� &0 alljabberregister allJabberRegister � J   � � � �  � � � o   � ����� ,0 jabberonlineregister jabberOnlineRegister �  � � � o   � ����� (0 jabberawayregister jabberAwayRegister �  � � � o   � ����� (0 jabberidleregister jabberIdleRegister �  ��� � o   � ����� .0 jabberofflineregister jabberOfflineRegister��   �  � � � j   � ��� ��� >0 jabbertransportonlineregister jabberTransportOnlineRegister � m   � � � � $ Jabber transport online status    �  � � � j   � ��� ��� :0 jabbertransportawayregister jabberTransportAwayRegister � m   � � � � " Jabber transport away status    �  � � � j   � ��� ��� :0 jabbertransportidleregister jabberTransportIdleRegister � m   � � � � " Jabber transport idle status    �  � � � j   � ��� ��� @0 jabbertransportofflineregister jabberTransportOfflineRegister � m   � � � � % Jabber transport Offline status    �  � � � j   � ��� ��� 80 alljabbertransportregister allJabberTransportRegister � J   � � � �  � � � o   � ����� >0 jabbertransportonlineregister jabberTransportOnlineRegister �  � � � o   � ����� :0 jabbertransportawayregister jabberTransportAwayRegister �  � � � o   � ����� :0 jabbertransportidleregister jabberTransportIdleRegister �  ��� � o   � ����� @0 jabbertransportofflineregister jabberTransportOfflineRegister��   �  � � � j   � �� ��� .0 bonjouronlineregister bonjourOnlineRegister � b   � � � � � o   � ����� (0 bonjourservicename bonjourServiceName � m   � � � �   online status    �  � � � j  	�� ��� *0 bonjourawayregister bonjourAwayRegister � b   � � � o  ���� (0 bonjourservicename bonjourServiceName � m   � �   away status    �  � � � j  
�� ��� *0 bonjouridleregister bonjourIdleRegister � b  
 � � � o  
���� (0 bonjourservicename bonjourServiceName � m   � �   idle status    �  � � � j  �� ��� 00 bonjourofflineregister bonjourOfflineRegister � b   � � � o  ���� (0 bonjourservicename bonjourServiceName � m   � �  offline status    �  � � � j  -�� ��� (0 allbonjourregister allBonjourRegister � J  * � �  � � � o  ���� .0 bonjouronlineregister bonjourOnlineRegister �  � � � o  "���� *0 bonjourawayregister bonjourAwayRegister �  � � � o  "%���� *0 bonjouridleregister bonjourIdleRegister �  ��� � o  %(���� 00 bonjourofflineregister bonjourOfflineRegister��   �  � � � j  .@�� ��� 0 allregister allRegister � b  .= � � � b  .9 � � � b  .5 � � � o  .1����  0 allaimregister allAimRegister � o  14���� &0 alljabberregister allJabberRegister � o  58���� 80 alljabbertransportregister allJabberTransportRegister � o  9<���� (0 allbonjourregister allBonjourRegister �  � � � j  AG�� ��� 0 
dummyblank 
dummyBlank � m  AD � �       �    j  HN���� 0 
appversion 
appVersion m  HK 	 0.7     j  OU���� 0 ichatversion iChatVersion m  OR 	 0.0    	 j  V\��
�� &0 ichattigerversion iChatTigerVersion
 m  VY 	 3.0   	  j  ]a���� 0 fail   m  ]^����    j  bf���� 0 pass   m  bc����   i  gj I     ������
�� .aevtoappnull  �   � ****��  ��   Q     � k    x  Z    q���� n    I    ��������  0 isichatrunning isIChatRunning��  ��    f     O    m !  k    l"" #$# l    �%�  %  activate   $ &'& r    ()( 1    �~
�~ 
vers) o      �}�} 0 ichatversion iChatVersion' *�|* Z    l+,�{-+ A    $./. o    �z�z 0 ichatversion iChatVersion/ o    #�y�y &0 ichattigerversion iChatTigerVersion, k   ' L00 121 l   ' '�x3�x  3  Panther   2 454 r   ' .676 m   ' (88  
Rendezvous   7 o      �w�w (0 bonjourservicename bonjourServiceName5 9:9 r   / :;<; n  / 4=>= I   0 4�v�u�t�v  0 getpantherlist getPantherList�u  �t  >  f   / 0< o      �s�s 0 lastlist lastList: ?@? n  ; @ABA I   < @�r�q�p�r $0 bonjourjustlogin bonjourJustLogIn�q  �p  B  f   ; <@ CDC n  A FEFE I   B F�o�n�m�o "0 jabberjustlogin jabberJustLogIn�n  �m  F  f   A BD G�lG n  G LHIH I   H L�k�j�i�k 0 aimjustlogin aimJustLogin�j  �i  I  f   G H�l  �{  - k   O lJJ KLK l   O O�hM�h  M  Tiger   L NON r   O ZPQP n  O TRSR I   P T�g�f�e�g 0 gettigerlist getTigerList�f  �e  S  f   O PQ o      �d�d 0 lastlist lastListO TUT n  [ `VWV I   \ `�c�b�a�c $0 bonjourjustlogin bonjourJustLogIn�b  �a  W  f   [ \U XYX n  a fZ[Z I   b f�`�_�^�` "0 jabberjustlogin jabberJustLogIn�_  �^  [  f   a bY \�]\ n  g l]^] I   h l�\�[�Z�\ 0 aimjustlogin aimJustLogin�[  �Z  ^  f   g h�]  �|  ! m    __�null     ߀��  d	iChat.app���@    �!@�����`  E|�8   )       �(� l���֐+fez!  alis    H  Macintosh HD               ����H+    d	iChat.app                                                       z뇾c��        ����  	                Applications    ���/      �d,      d  #Macintosh HD:Applications:iChat.app    	 i C h a t . a p p    M a c i n t o s h   H D  Applications/iChat.app  / ��  ��  ��   `�Y` L   r xaa o   r w�X�X 0 waitidletime waitIdleTime�Y   R      �W�V�U
�W .ascrerr ****      � ****�V  �U   L   � �bb o   � ��T�T 0 waitidletime waitIdleTime cdc l     �S�R�S  �R  d efe i  knghg I     �Q�P�O
�Q .miscidlenmbr    ��� null�P  �O  h Q     jijki k    Kll mnm l    �No�N  o  register with growl   n pqp Z    (rs�Mtr H    	uu o    �L�L &0 alreadyregistered alreadyRegistereds Z    $vw�K�Jv =   xyx n   z{z I    �I�H�G�I &0 registerwithgrowl registerWithGrowl�H  �G  {  f    y o    �F�F 0 fail  w L     || o    �E�E 0 idletime idleTime�K  �J  �M  t l   ' '�D}�D  }  
do nothing   q ~~ l   ) )�C��C  � v p
		if the program pass this point the variable iChatVersion is already set
		also bonjour stuff is already set
	    ��� Z   ) D���B�� A   ) 4��� o   ) .�A�A 0 ichatversion iChatVersion� o   . 3�@�@ &0 ichattigerversion iChatTigerVersion� k   7 <�� ��� l   7 7�?��?  �  panther   � ��>� n  7 <��� I   8 <�=�<�;�= 0 	dopanther 	doPanther�<  �;  �  f   7 8�>  �B  � k   ? D�� ��� l   ? ?�:��:  �  tiger   � ��9� n  ? D��� I   @ D�8�7�6�8 0 dotiger doTiger�7  �6  �  f   ? @�9  � ��� l  E E�5�4�5  �4  � ��3� L   E K�� o   E J�2�2 0 idletime idleTime�3  j R      �1�0�/
�1 .ascrerr ****      � ****�0  �/  k k   S j�� ��� l   S c��� r   S c��� J   S ]�� ��� J   S U�.�.  � ��� J   U W�-�-  � ��� J   W Y�,�,  � ��+� J   Y [�*�*  �+  � o      �)�) 0 lastlist lastList� - 'make sure this comply with the property   � ��(� L   d j�� o   d i�'�' 0 idletime idleTime�(  f ��� l      �&��&  � � �
	registerWithGrowl()
	check version and register the notif with growl according to the version
	return pass if registeration success
	return fail if registeration fail
   � ��� i  or��� I      �%�$�#�% &0 registerwithgrowl registerWithGrowl�$  �#  � Z    ���"�� n    ��� I    �!� ��!  0 isgrowlrunning isGrowlRunning�   �  �  f     � k   �� ��� l    ���  �  check version   � ��� Z    '����� n   ��� I   	 ����  0 isichatrunning isIChatRunning�  �  �  f    	� O    ��� r    ��� 1    �
� 
vers� o      �� 0 ichatversion iChatVersion� m    _�  � L   ! '�� o   ! &�� 0 fail  � ��� Z   (����� A   ( 3��� o   ( -�� 0 ichatversion iChatVersion� o   - 2�� &0 ichattigerversion iChatTigerVersion� k   6 ��� ��� l   6 6���  �  panther   � ��� r   6 =��� m   6 7��  
Rendezvous   � o      �� (0 bonjourservicename bonjourServiceName� ��� r   > K��� b   > E��� o   > C�� (0 bonjourservicename bonjourServiceName� m   C D��   online status   � o      �� .0 bonjouronlineregister bonjourOnlineRegister� ��� r   L Y��� b   L S��� o   L Q�� (0 bonjourservicename bonjourServiceName� m   Q R��   away status   � o      �� *0 bonjourawayregister bonjourAwayRegister� ��� r   Z g��� b   Z a��� o   Z _�� (0 bonjourservicename bonjourServiceName� m   _ `��   idle status   � o      �� *0 bonjouridleregister bonjourIdleRegister� ��� r   h u��� b   h o��� o   h m�
�
 (0 bonjourservicename bonjourServiceName� m   m n��  offline status   � o      �	�	 00 bonjourofflineregister bonjourOfflineRegister� ��� r   v ���� J   v ��� ��� o   v {�� .0 bonjouronlineregister bonjourOnlineRegister� ��� o   { ��� *0 bonjourawayregister bonjourAwayRegister� ��� o   � ��� *0 bonjouridleregister bonjourIdleRegister� ��� o   � ��� 00 bonjourofflineregister bonjourOfflineRegister�  � o      �� (0 allbonjourregister allBonjourRegister� ��� r   � �   b   � � o   � ���  0 allaimregister allAimRegister o   � ��� (0 allbonjourregister allBonjourRegister o      � �  0 allregister allRegister�  O   � � k   � � 	
	 r   � � o   � ����� 0 allregister allRegister o      ���� 0 defaultnotifs defaultNotifs
  r   � � o   � ����� 0 defaultnotifs defaultNotifs o      ���� 
0 notifs   �� I  � �����
�� .registernull��� ��� null��   ��
�� 
appl o   � ����� 0 appname appName ��
�� 
anot o   � ����� 
0 notifs   ��
�� 
dnot o   � ����� 
0 notifs   ����
�� 
iapp m   � �  iChat   ��  ��   m   � �2null     ߀�� K�GrowlHelperApp.app!@����Ԑ  �|�P   )       �(� l�����+GRRR   alis    �  Macintosh HD               ����H+   K�GrowlHelperApp.app                                              K;��B        ����  	                	Resources     ���/      ��ς     K� K� K� C�    YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��    r   � � m   � ���
�� boovtrue o      ���� &0 alreadyregistered alreadyRegistered  ��  L   � �!! o   � ����� 0 pass  ��  �  � k   �"" #$# l   � ���%��  %  tiger   $ &'& O   �()( k   � ** +,+ r   � �-.- o   � ����� 0 allregister allRegister. o      ���� 0 defaultnotifs defaultNotifs, /0/ r   � �121 o   � ����� 0 defaultnotifs defaultNotifs2 o      ���� 
0 notifs  0 3��3 I  � ����4
�� .registernull��� ��� null��  4 ��56
�� 
appl5 o   � ����� 0 appname appName6 ��78
�� 
anot7 o   � ����� 
0 notifs  8 ��9:
�� 
dnot9 o   � ����� 
0 notifs  : ��;��
�� 
iapp; m   � �<<  iChat   ��  ��  ) m   � �' =>= r  	?@? m  ��
�� boovtrue@ o      ���� &0 alreadyregistered alreadyRegistered> A��A L  
BB o  
���� 0 pass  ��  �  �"  � L  CC o  ���� 0 fail  � DED l      ��F��  F &  do the main function for panther   E GHG i  svIJI I      �������� 0 	dopanther 	doPanther��  ��  J Q     \KLMK k    RNN OPO r    
QRQ I    ��������  0 getpantherlist getPantherList��  ��  R o      ���� 0 alllist allListP STS n   .UVU I    .��W���� 0 
mainnotify 
mainNotifyW XYX n    Z[Z 4    ��\
�� 
cobj\ o    ���� "0 aimserviceindex aimServiceIndex[ o    ���� 0 alllist allListY ]^] n     _`_ 4     ��a
�� 
cobja o    ���� "0 aimserviceindex aimServiceIndex` o    ���� 0 lastlist lastList^ bcb o     %���� "0 aimserviceindex aimServiceIndexc d��d o   % *����  0 aimservicename aimServiceName��  ��  V  f    T e��e n  / Rfgf I   0 R��h���� 0 
mainnotify 
mainNotifyh iji n   0 8klk 4   1 8��m
�� 
cobjm o   2 7���� *0 bonjourserviceindex bonjourServiceIndexl o   0 1���� 0 alllist allListj non n   8 Dpqp 4   = D��r
�� 
cobjr o   > C���� *0 bonjourserviceindex bonjourServiceIndexq o   8 =���� 0 lastlist lastListo sts o   D I���� *0 bonjourserviceindex bonjourServiceIndext u��u o   I N���� (0 bonjourservicename bonjourServiceName��  ��  g  f   / 0��  L R      ������
�� .ascrerr ****      � ****��  ��  M L   Z \����  H vwv l      ��x��  x $ do the main function for tiger   w yzy i  wz{|{ I      �������� 0 dotiger doTiger��  ��  | Q     �}~} k    ��� ��� r    
��� I    �������� 0 gettigerlist getTigerList��  ��  � o      ���� 0 alllist allList� ��� n   .��� I    .������� 0 
mainnotify 
mainNotify� ��� n    ��� 4    ���
�� 
cobj� o    ���� "0 aimserviceindex aimServiceIndex� o    ���� 0 alllist allList� ��� n     ��� 4     ���
�� 
cobj� o    ���� "0 aimserviceindex aimServiceIndex� o    ���� 0 lastlist lastList� ��� o     %���� "0 aimserviceindex aimServiceIndex� ���� o   % *����  0 aimservicename aimServiceName��  ��  �  f    � ��� n  / R��� I   0 R������� 0 
mainnotify 
mainNotify� ��� n   0 8��� 4   1 8���
�� 
cobj� o   2 7���� *0 bonjourserviceindex bonjourServiceIndex� o   0 1���� 0 alllist allList� ��� n   8 D��� 4   = D���
�� 
cobj� o   > C���� *0 bonjourserviceindex bonjourServiceIndex� o   8 =���� 0 lastlist lastList� ��� o   D I���� *0 bonjourserviceindex bonjourServiceIndex� ���� o   I N���� (0 bonjourservicename bonjourServiceName��  ��  �  f   / 0� ��� n  S v��� I   T v������� 0 
mainnotify 
mainNotify� ��� n   T \��� 4   U \���
�� 
cobj� o   V [���� (0 jabberserviceindex jabberServiceIndex� o   T U���� 0 alllist allList� ��� n   \ h��� 4   a h���
�� 
cobj� o   b g���� (0 jabberserviceindex jabberServiceIndex� o   \ a���� 0 lastlist lastList� ��� o   h m���� (0 jabberserviceindex jabberServiceIndex� ���� o   m r���� &0 jabberservicename jabberServiceName��  ��  �  f   S T� ���� n  w ���� I   x �������� 0 
mainnotify 
mainNotify� ��� n   x ���� 4   y ����
�� 
cobj� o   z ���� :0 jabbertransportserviceindex jabberTransPortServiceIndex� o   x y���� 0 alllist allList� ��� n   � ���� 4   � ����
�� 
cobj� o   � ����� :0 jabbertransportserviceindex jabberTransPortServiceIndex� o   � ����� 0 lastlist lastList� ��� o   � ����� :0 jabbertransportserviceindex jabberTransPortServiceIndex� ���� o   � ����� 80 jabbertransportservicename jabberTransportServiceName��  ��  �  f   w x��  ~ R      ��~�}
� .ascrerr ****      � ****�~  �}   L   � ��|�|  z ��� l      �{��{  � i c
	compare lists
	send alert for those who change
	and update lastList
	invariant: lists are sorted
   � ��� i  {~��� I      �z��y�z 0 
mainnotify 
mainNotify� ��� o      �x�x 0 newlist newList� ��� o      �w�w 0 oldlist oldList� ��� o      �v�v 0 serviceindex serviceIndex� ��u� o      �t�t 0 servicename serviceName�u  �y  � k     ��� ��� l      �s��s  �  	check aim   � ��r� Q     ����� Z    ����q�� n   ��� I    �p�o�n�p  0 isichatrunning isIChatRunning�o  �n  �  f    � k    ��� ��� r    ��� n   ��� I    �m��l�m 0 isjustlogin isJustLogIn� ��� o    �k�k 0 servicename serviceName� ��j� o    �i�i 0 serviceindex serviceIndex�j  �l  �  f    � o      �h�h $0 accountjustlogin accountJustLogin� ��� l   �g�f�g  �f  � ��� l    �e��e  �  send aim   � ��� Z    ����d�� ?    ��� n   � � I    �c�b�c 0 getdelaytime getDelayTime �a o    �`�` 0 serviceindex serviceIndex�a  �b     f    � m    �_�_  � k     )  n    & I   ! &�^�]�^ &0 decreasedelaytime decreaseDelayTime 	�\	 o   ! "�[�[ 0 serviceindex serviceIndex�\  �]    f     ! 
�Z
 L   ' )�Y�Y  �Z  �d  � Z   , ��X o   , -�W�W $0 accountjustlogin accountJustLogin l   0 0�V�V    
do nothing   �X   k   4 �  r   4 = n  4 ; I   5 ;�U�T�U 0 getnotifylist getNotifyList  o   5 6�S�S 0 newlist newList �R o   6 7�Q�Q 0 oldlist oldList�R  �T    f   4 5 o      �P�P 0 
changelist 
changeList  l   > >�O�O   8 2display dialog changeList as string buttons {"OK"}     Z   > L �N�M =   > C!"! n   > A#$# 1   ? A�L
�L 
leng$ o   > ?�K�K 0 
changelist 
changeList" m   A B�J�J    L   F H�I�I  �N  �M   %�H% Y   M �&�G'(�F& k   Z �)) *+* r   Z `,-, n   Z ^./. 4   [ ^�E0
�E 
cobj0 o   \ ]�D�D 0 i  / o   Z [�C�C 0 
changelist 
changeList- o      �B�B 0 thisuser thisUser+ 1�A1 n  a �232 I   b ��@4�?�@ 
0 notify  4 565 n   b j787 4   c j�>9
�> 
cobj9 o   d i�=�= 0 idindex idIndex8 o   b c�<�< 0 thisuser thisUser6 :;: n   j r<=< 4   k r�;>
�; 
cobj> o   l q�:�: 0 statusindex statusIndex= o   j k�9�9 0 thisuser thisUser; ?@? n   r zABA 4   s z�8C
�8 
cobjC o   t y�7�7 (0 statusmessageindex statusMessageIndexB o   r s�6�6 0 thisuser thisUser@ DED n   z �FGF l 	 { �H�5H 4   { ��4I
�4 
cobjI o   | ��3�3 0 	nameindex 	nameIndex�5  G o   z {�2�2 0 thisuser thisUserE JKJ o   � ��1�1 0 servicename serviceNameK L�0L o   � ��/�/ 0 serviceindex serviceIndex�0  �?  3  f   a b�A  �G 0 i  ' m   P Q�.�. ( n   Q UMNM 1   R T�-
�- 
lengN o   Q R�,�, 0 
changelist 
changeList�F  �H  � OPO l   � ��+Q�+  Q J Dif modified make sure it conforms with 
				aimIndex and jabberIndex   P R�*R r   � �STS o   � ��)�) 0 newlist newListT n      UVU 4   � ��(W
�( 
cobjW o   � ��'�' 0 serviceindex serviceIndexV o   � ��&�& 0 lastlist lastList�*  �q  � k   � �XX YZY l   � ��%[�%  [  
do nothing   Z \�$\ r   � �]^] J   � ��#�#  ^ n      _`_ 4   � ��"a
�" 
cobja o   � ��!�! 0 serviceindex serviceIndex` o   � �� �  0 lastlist lastList�$  � R      ���
� .ascrerr ****      � ****�  �  � k   � �bb cdc r   � �efe J   � ���  f n      ghg 4   � ��i
� 
cobji o   � ��� 0 serviceindex serviceIndexh o   � ��� 0 lastlist lastListd j�j L   � ���  �  �r  � klk l      �m�  m  send notification to aim   l non i  �pqp I      �r�� 
0 notify  r sts o      �� 0 thisid thisIdt uvu o      �� 0 
thisstatus 
thisStatusv wxw o      �� &0 thisstatusmessage thisStatusMessagex yzy o      �� 0 thisname thisNamez {|{ o      �� 0 servicename serviceName| }�} o      �� 0 serviceindex serviceIndex�  �  q Q    ~�~ Z   ����� n   ��� I    �
�	��
  0 isgrowlrunning isGrowlRunning�	  �  �  f    � Z   ����� n   ��� I    ����  0 isichatrunning isIChatRunning�  �  �  f    � O    ��� k    ��� ��� r    ��� o    �� 0 thisname thisName� o      �� 0 thename theName� ��� r    #��� n   !��� I    !� ����  "0 stringforstatus stringForStatus� ���� o    ���� 0 
thisstatus 
thisStatus��  ��  �  f    � o      ���� 0 	thestatus 	theStatus� ��� Z   $ I������ >   $ +��� o   $ %���� 0 serviceindex serviceIndex� o   % *���� :0 jabbertransportserviceindex jabberTransPortServiceIndex� Z   . C������� =   . 1��� o   . /���� 0 
thisstatus 
thisStatus� m   / 0��
�� pstaaway� r   4 ?��� b   4 =��� b   4 ;��� o   4 5���� 0 	thestatus 	theStatus� o   5 :���� 0 newline  � o   ; <���� &0 thisstatusmessage thisStatusMessage� o      ���� 0 	thestatus 	theStatus��  ��  ��  � r   F I��� o   F G���� &0 thisstatusmessage thisStatusMessage� o      ���� 0 thename theName� ��� r   J S��� n  J Q��� I   K Q������� *0 getnotificationname getNotificationName� ��� o   K L���� 0 serviceindex serviceIndex� ���� o   L M���� 0 
thisstatus 
thisStatus��  ��  �  f   J K� o      ���� $0 notificationname notificationName� ���� Q   T ����� Z   W ������� n  W \��� I   X \��������  0 isichatrunning isIChatRunning��  ��  �  f   W X� k   _ ��� ��� r   _ s��� l  _ q���� n   _ q��� 1   o q��
�� 
imaA� l  _ o���� 6 _ o��� n   _ f��� 4  c f���
�� 
pres� m   d e���� � l  _ c���� 4   _ c���
�� 
icsv� o   a b���� 0 servicename serviceName��  � =  g n��� 1   h j��
�� 
ID  � o   k m���� 0 thisid thisId��  ��  � l     ���� o      ���� 0 
displaypic 
displayPic��  � ���� O   t ���� I  x ������
�� .notifygrnull��� ��� null��  � ����
�� 
name� o   z {���� $0 notificationname notificationName� ����
�� 
titl� o   | }���� 0 thename theName� ����
�� 
appl� o   ~ ����� 0 appname appName� ����
�� 
desc� o   � ����� 0 	thestatus 	theStatus� �����
�� 
imag� l  � ����� o   � ����� 0 
displaypic 
displayPic��  ��  � m   t u��  ��  � L   � �����  � R      ������
�� .ascrerr ****      � ****��  ��  � Q   � ����� Z   � ������� n  � ���� I   � ���������  0 isichatrunning isIChatRunning��  ��  �  f   � �� k   � ��� ��� r   � ���� l  � ����� n   � ���� 1   � ���
�� 
imaA� l  � ����� 4   � ����
�� 
icsv� o   � ����� 0 servicename serviceName��  ��  � l     ���� o      ���� 0 
displaypic 
displayPic��  � ���� O   � ���� I  � ������
�� .notifygrnull��� ��� null��  � ����
�� 
name� o   � ����� $0 notificationname notificationName� ����
�� 
titl� o   � ����� 0 thename theName� ����
�� 
appl� o   � ����� 0 appname appName� ����
�� 
desc� o   � ����� 0 	thestatus 	theStatus� �����
�� 
imag� l  � ����� o   � ����� 0 
displaypic 
displayPic��  ��  � m   � ���  ��  � L   � �����  � R      ������
�� .ascrerr ****      � ****��  ��  � Q   � �   O   � � I  � �����
�� .notifygrnull��� ��� null��   ��
�� 
name o   � ����� $0 notificationname notificationName ��	
�� 
titl o   � ����� 0 thename theName	 ��

�� 
appl
 o   � ����� 0 appname appName ����
�� 
desc o   � ����� 0 	thestatus 	theStatus��   m   � � R      ������
�� .ascrerr ****      � ****��  ��   L   � �����  ��  � m    _�  �  �  �   R      ������
�� .ascrerr ****      � ****��  ��  � L  ����  o  l      ����   I C
	return notification name according to serviceName and thisStatus
     i  �� I      ������ *0 getnotificationname getNotificationName  o      ���� 0 serviceindex serviceIndex �� o      ���� 0 	thestatus 	theStatus��  ��   Z    =�� I     ��������  0 isichatrunning isIChatRunning��  ��   w   8_ Z   
8 =   
  !  o   
 ���� 0 serviceindex serviceIndex! o    ���� "0 aimserviceindex aimServiceIndex Z    R"#$%" =   &'& o    ���� 0 	thestatus 	theStatus' m    ��
�� pstaaway# L     (( o    ���� "0 aimawayregister aimAwayRegister$ )*) =  # &+,+ o   # $���� 0 	thestatus 	theStatus, m   $ %��
�� pstaoffl* -.- L   ) /// o   ) .���� (0 aimofflineregister aimOfflineRegister. 010 =  2 5232 o   2 3���� 0 	thestatus 	theStatus3 m   3 4��
�� pstaaval1 454 L   8 >66 o   8 =�� &0 aimonlineregister aimOnlineRegister5 787 =  A D9:9 o   A B�~�~ 0 	thestatus 	theStatus: l  B C;�}; m   B C�|
�| pstaidle�}  8 <�{< L   G M== o   G L�z�z "0 aimidleregister aimIdleRegister�{  % L   P R>> m   P Q??       @A@ =   U \BCB o   U V�y�y 0 serviceindex serviceIndexC o   V [�x�x (0 jabberserviceindex jabberServiceIndexA DED Z   _ �FGHIF =  _ bJKJ o   _ `�w�w 0 	thestatus 	theStatusK m   ` a�v
�v pstaawayG L   e kLL o   e j�u�u (0 jabberawayregister jabberAwayRegisterH MNM =  n qOPO o   n o�t�t 0 	thestatus 	theStatusP m   o p�s
�s pstaofflN QRQ L   t zSS o   t y�r�r .0 jabberofflineregister jabberOfflineRegisterR TUT =  } �VWV o   } ~�q�q 0 	thestatus 	theStatusW m   ~ �p
�p pstaavalU XYX L   � �ZZ o   � ��o�o ,0 jabberonlineregister jabberOnlineRegisterY [\[ =  � �]^] o   � ��n�n 0 	thestatus 	theStatus^ l  � �_�m_ m   � ��l
�l pstaidle�m  \ `�k` L   � �aa o   � ��j�j (0 jabberidleregister jabberIdleRegister�k  I L   � �bb m   � �cc      E ded =   � �fgf o   � ��i�i 0 serviceindex serviceIndexg o   � ��h�h *0 bonjourserviceindex bonjourServiceIndexe hih Z   � �jklmj =  � �non o   � ��g�g 0 	thestatus 	theStatuso m   � ��f
�f pstaawayk L   � �pp o   � ��e�e *0 bonjourawayregister bonjourAwayRegisterl qrq =  � �sts o   � ��d�d 0 	thestatus 	theStatust m   � ��c
�c pstaofflr uvu L   � �ww o   � ��b�b 00 bonjourofflineregister bonjourOfflineRegisterv xyx =  � �z{z o   � ��a�a 0 	thestatus 	theStatus{ m   � ��`
�` pstaavaly |}| L   � �~~ o   � ��_�_ .0 bonjouronlineregister bonjourOnlineRegister} � =  � ���� o   � ��^�^ 0 	thestatus 	theStatus� l  � ���]� m   � ��\
�\ pstaidle�]  � ��[� L   � ��� o   � ��Z�Z *0 bonjouridleregister bonjourIdleRegister�[  m L   � ��� m   � ���      i ��� =   � ���� o   � ��Y�Y 0 serviceindex serviceIndex� o   � ��X�X :0 jabbertransportserviceindex jabberTransPortServiceIndex� ��W� Z   �3����� =  � ���� o   � ��V�V 0 	thestatus 	theStatus� m   � ��U
�U pstaaway� L   ��� o   � �T�T :0 jabbertransportawayregister jabberTransportAwayRegister� ��� = ��� o  �S�S 0 	thestatus 	theStatus� m  �R
�R pstaoffl� ��� L  
�� o  
�Q�Q @0 jabbertransportofflineregister jabberTransportOfflineRegister� ��� = ��� o  �P�P 0 	thestatus 	theStatus� m  �O
�O pstaaval� ��� L  �� o  �N�N >0 jabbertransportonlineregister jabberTransportOnlineRegister� ��� = "%��� o  "#�M�M 0 	thestatus 	theStatus� l #$��L� m  #$�K
�K pstaidle�L  � ��J� L  (.�� o  (-�I�I :0 jabbertransportidleregister jabberTransportIdleRegister�J  � L  13�� m  12��      �W   l  68��� L  68�� m  67��      �  
impossible   ��   L  ;=�� m  ;<��       ��� l     �H�G�H  �G  � ��� i  ����� I      �F��E�F "0 stringforstatus stringForStatus� ��D� o      �C�C 0 s  �D  �E  � Q     J���� Z    @���B�� I    �A�@�?�A  0 isichatrunning isIChatRunning�@  �?  � w    ;�_� Z    ;����� =   ��� o    �>�> 0 s  � m    �=
�= pstaaway� L    �� m    ��  is away   � ��� =   ��� o    �<�< 0 s  � m    �;
�; pstaoffl� ��� L     �� m    ��  went offline   � ��� =  # &��� o   # $�:�: 0 s  � m   $ %�9
�9 pstaaval� ��� L   ) +�� m   ) *��  is available   � ��� =  . 1��� o   . /�8�8 0 s  � m   / 0�7
�7 pstaidle� ��6� L   4 6�� m   4 5��  	is idling   �6  � L   9 ;�� m   9 :��  status is unknown   �B  � L   > @�� m   > ?��  status is unknown   � R      �5�4�3
�5 .ascrerr ****      � ****�4  �3  � L   H J�� m   H I��      � ��� l     �2�1�2  �1  � ��� i  ����� I      �0�/�.�0  0 isichatrunning isIChatRunning�/  �.  � Q     ���� O    ��� L    �� I   �-��,
�- .coredoexbool       obj � 4    �+�
�+ 
prcs� m   	 
��  iChat   �,  � m    ���null     ߀�� y��System Events.app�!@�����   H:|�(   )       �(� l����P+sevs   alis    �  Macintosh HD               ����H+   y��System Events.app                                               z�c��        ����  	                CoreServices    ���/      �c��     y�� y�h y�g  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � R      �*�)�(
�* .ascrerr ****      � ****�)  �(  � L    �� m    �'
�' boovfals� ��� i  ����� I      �&�%�$�&  0 isgrowlrunning isGrowlRunning�%  �$  � Q     ���� O    ��� L    �� I   �# �"
�# .coredoexbool       obj   4    �!
�! 
prcs m   	 
  GrowlHelperApp   �"  � m    �� R      � ��
�  .ascrerr ****      � ****�  �  � L     m    �
� boovfals�  i  �� I      ��� &0 isjabbertransport isJabberTransport 	�	 1      �
� 
ID  �  �   L     

 l    � E      1     �
� 
ID   m      %   �    i  �� I      ���� 0 gettigerlist getTigerList�  �   l    g k     g  r      I     ���� 00 getavailablejabberlist getAvailableJabberList�  �   o      �� 0 
jabberlist 
jabberList  r     J    
��   o      �� *0 jabbertransportlist jabberTransportList  r     !  J    ��  ! o      ��  0 realjabberlist realJabberList "#" l    �$�  $ P Jsplit jabber and jabber Transport by looking at the percent sign in the id   # %&% Y    C'�
()�	' k    >** +,+ r    %-.- n    #/0/ 4     #�1
� 
cobj1 o   ! "�� 0 i  0 o     �� 0 
jabberlist 
jabberList. o      �� 0 thiselement thisElement, 2�2 Z   & >34�53 l  & 06�6 E   & 0787 n   & .9:9 4   ' .�;
� 
cobj; o   ( -� �  0 idindex idIndex: o   & '���� 0 thiselement thisElement8 m   . /<<  %   �  4 s   3 7=>= o   3 4���� 0 thiselement thisElement> l     ?��? n      @A@  ;   5 6A o   4 5���� *0 jabbertransportlist jabberTransportList��  �  5 s   : >BCB o   : ;���� 0 thiselement thisElementC l     D��D n      EFE  ;   < =F o   ; <����  0 realjabberlist realJabberList��  �  �
 0 i  ( m    ���� ) n    GHG 1    ��
�� 
lengH o    ���� 0 
jabberlist 
jabberList�	  & IJI l   D D��K��  K . (make sure this comply with service index   J L��L L   D gMM J   D fNN OPO n  D JQRQ I   E J��S���� 0 sort  S T��T o   E F����  0 realjabberlist realJabberList��  ��  R  f   D EP UVU n  J TWXW I   K T��Y���� 0 sort  Y Z��Z n  K P[\[ I   L P�������� *0 getavailableaimlist getAvailableAimList��  ��  \  f   K L��  ��  X  f   J KV ]^] n  T ^_`_ I   U ^��a���� 0 sort  a b��b n  U Zcdc I   V Z�������� 20 getavailablebonjourlist getAvailableBonjourList��  ��  d  f   U V��  ��  `  f   T U^ e��e n  ^ dfgf I   _ d��h���� 0 sort  h i��i o   _ `���� *0 jabbertransportlist jabberTransportList��  ��  g  f   ^ _��  ��   ( "make sure this conforms to indices    jkj l     ������  ��  k lml i  ��non I      ��������  0 getpantherlist getPantherList��  ��  o k     pp qrq l      ��s��  s . (make sure this comply with service index   r t��t L     uu J     vv wxw J     ����  x yzy n   {|{ I    ��}���� 0 sort  } ~��~ n   � I    �������� *0 getavailableaimlist getAvailableAimList��  ��  �  f    ��  ��  |  f    z ��� n   ��� I    ������� 0 sort  � ���� n   ��� I    �������� 20 getavailablebonjourlist getAvailableBonjourList��  ��  �  f    ��  ��  �  f    � ���� J    ����  ��  ��  m ��� l      �����  � c ]beware when calling this function; it doesn't distinguish between jabber transport and jabber   � ��� i  ����� I      �������� 00 getavailablejabberlist getAvailableJabberList��  ��  � L     �� n    
��� I    
������� $0 getavailablelist getAvailableList� ���� o    ���� &0 jabberservicename jabberServiceName��  ��  �  f     � ��� i  ����� I      �������� *0 getavailableaimlist getAvailableAimList��  ��  � L     �� n    
��� I    
������� $0 getavailablelist getAvailableList� ���� o    ����  0 aimservicename aimServiceName��  ��  �  f     � ��� i  ����� I      �������� 20 getavailablebonjourlist getAvailableBonjourList��  ��  � L     �� n    
��� I    
������� $0 getavailablelist getAvailableList� ���� o    ���� (0 bonjourservicename bonjourServiceName��  ��  �  f     � ��� l      �����  � � �on getLastJabberList()
	return item jabberServiceIndex of lastList
end getLastJabberList
on getLastAimList()
	return item aimServiceIndex of lastList
end getLastAimList   � ��� l     ������  ��  � ��� l      �����  � � �
	getAvailable(serviceName)
	return {id, status message} list({{a,b},{c,d},...}) for given serviceName
	note: the result is zipped but unsorted
   � ��� i  ����� I      ������� $0 getavailablelist getAvailableList� ���� o      ���� 0 servicename serviceName��  ��  � Q     l���� Z    a������ n   ��� I    ��������  0 isichatrunning isIChatRunning��  ��  �  f    � O    [��� k    Z�� ��� r    3��� n    1��� J    1�� ��� 1    !��
�� 
ID  � ��� 1   # %��
�� 
smsg� ��� 1   ' )��
�� 
stat� ���� 1   + -��
�� 
pnam��  � l   ���� 6  ��� l   ���� n    ��� 2    ��
�� 
pres� l   ���� 4    ���
�� 
icsv� o    ���� 0 servicename serviceName��  ��  � >   ��� 1    ��
�� 
stat� m    ��
�� pstaoffl��  � o      ���� 0 thelist theList� ��� l   4 4�����  � * $this works since status is exclusive   � ���� L   4 Z�� n  4 Y��� I   5 Y������� 0 ziplist zipList� ��� n   5 =��� 4   6 =���
�� 
cobj� o   7 <���� 0 idindex idIndex� o   5 6���� 0 thelist theList� ��� n   = E��� 4   > E���
�� 
cobj� o   ? D���� (0 statusmessageindex statusMessageIndex� o   = >���� 0 thelist theList� ��� n   E M��� 4   F M���
�� 
cobj� o   G L���� 0 statusindex statusIndex� o   E F���� 0 thelist theList� ���� n   M U��� 4   N U���
�� 
cobj� o   O T���� 0 	nameindex 	nameIndex� o   M N���� 0 thelist theList��  ��  �  f   4 5��  � m    _��  � L   ^ a�� J   ^ `����  � R      ������
�� .ascrerr ****      � ****��  ��  � L   i l�� J   i k����  � ��� l      �����  � r l
	getNotifyList(newList, oldList)
	return list of ppo whose status change
	invariant: both lists are sorted
   � ��� i  ����� I      ������� 0 getnotifylist getNotifyList� ��� o      �� 0 newlist newList�  �~  o      �}�} 0 oldlist oldList�~  ��  � k    0  r      m     �|�|  o      �{�{ 0 newindex newIndex  r    	 m    �z�z 	 o      �y�y 0 oldindex oldIndex 

 r     J    
�x�x   o      �w�w 0 toreturn toReturn  r     n     1    �v
�v 
leng o    �u�u 0 newlist newList o      �t�t 0 newlen newLen  r     n     1    �s
�s 
leng o    �r�r 0 oldlist oldList o      �q�q 0 oldlen oldLen  Z   %�p�o =     o    �n�n 0 newlen newLen m    �m�m   L    !   o     �l�l 0 oldlist oldList�p  �o   !"! Z  & 2#$�k�j# =   & )%&% o   & '�i�i 0 oldlen oldLen& m   ' (�h�h  $ L   , .'' o   , -�g�g 0 newlist newList�k  �j  " ()( V   3 �*+* k   C �,, -.- r   C I/0/ n   C G121 4   D G�f3
�f 
cobj3 o   E F�e�e 0 newindex newIndex2 o   C D�d�d 0 newlist newList0 o      �c�c 0 newitem newItem. 454 r   J P676 n   J N898 4   K N�b:
�b 
cobj: o   L M�a�a 0 oldindex oldIndex9 o   J K�`�` 0 oldlist oldList7 o      �_�_ 0 olditem oldItem5 ;<; r   Q [=>= n   Q Y?@? 4   R Y�^A
�^ 
cobjA o   S X�]�] 0 	nameindex 	nameIndex@ o   Q R�\�\ 0 newitem newItem> o      �[�[ 0 newname newName< BCB r   \ fDED n   \ dFGF 4   ] d�ZH
�Z 
cobjH o   ^ c�Y�Y 0 	nameindex 	nameIndexG o   \ ]�X�X 0 olditem oldItemE o      �W�W 0 oldname oldNameC I�VI Z   g �JKLMJ l  g jN�UN =   g jOPO o   g h�T�T 0 newname newNameP o   h i�S�S 0 oldname oldName�U  K k   m �QQ RSR r   m wTUT n   m uVWV 4   n u�RX
�R 
cobjX o   o t�Q�Q 0 statusindex statusIndexW o   m n�P�P 0 newitem newItemU o      �O�O 0 	newstatus 	newStatusS YZY r   x �[\[ n   x �]^] 4   y ��N_
�N 
cobj_ o   z �M�M 0 statusindex statusIndex^ o   x y�L�L 0 olditem oldItem\ o      �K�K 0 	oldstatus  Z `a` Z   � �bc�Jdb l  � �e�Ie >   � �fgf o   � ��H�H 0 	newstatus 	newStatusg o   � ��G�G 0 	oldstatus  �I  c s   � �hih o   � ��F�F 0 newitem newItemi l     j�Ej n      klk  ;   � �l o   � ��D�D 0 toreturn toReturn�E  �J  d l   � ��Cm�C  m  
do nothing   a non r   � �pqp [   � �rsr o   � ��B�B 0 newindex newIndexs m   � ��A�A q o      �@�@ 0 newindex newIndexo t�?t r   � �uvu [   � �wxw o   � ��>�> 0 oldindex oldIndexx m   � ��=�= v o      �<�< 0 oldindex oldIndex�?  L yzy A   � �{|{ o   � ��;�; 0 newname newName| o   � ��:�: 0 oldname oldNamez }�9} l  � �~~ k   � ��� ��� s   � ���� o   � ��8�8 0 newitem newItem� l     ��7� n      ���  ;   � �� o   � ��6�6 0 toreturn toReturn�7  � ��5� r   � ���� [   � ���� o   � ��4�4 0 newindex newIndex� m   � ��3�3 � o      �2�2 0 newindex newIndex�5   4 .make sure this comply with comparison in split   �9  M k   � ��� ��� l   � ��1��1  � < 6this guy went offline so need to set status to offline   � ��� w   � ��_� r   � ���� m   � ��0
�0 pstaoffl� n      ��� 4   � ��/�
�/ 
cobj� o   � ��.�. 0 statusindex statusIndex� o   � ��-�- 0 olditem oldItem� ��� s   � ���� o   � ��,�, 0 olditem oldItem� l     ��+� n      ���  ;   � �� o   � ��*�* 0 toreturn toReturn�+  � ��)� r   � ���� [   � ���� o   � ��(�( 0 oldindex oldIndex� m   � ��'�' � o      �&�& 0 oldindex oldIndex�)  �V  + F   7 B��� B   7 :��� o   7 8�%�% 0 newindex newIndex� o   8 9�$�$ 0 newlen newLen� B   = @��� o   = >�#�# 0 oldindex oldIndex� o   > ?�"�" 0 oldlen oldLen) ��� Z   �-����!� ?   � ���� o   � �� �  0 newindex newIndex� o   � ��� 0 newlen newLen� Z   ������ B   � ���� o   � ��� 0 oldindex oldIndex� o   � ��� 0 oldlen oldLen� k   ��� ��� l   � ����  � G Athese guys go offline so we need to change status in the old list   � ��� l   � ����  � ? 9set offLine guys to items oldIndex thru oldLen of oldList   � ��� w   ��_� k   ��� ��� Y   � ������� k   � ��� ��� r   � ���� n   � ���� 4   � ���
� 
cobj� o   � ��� 0 i  � o   � ��� 0 oldlist oldList� o      �� 0 thisitem thisItem� ��� r   � ���� m   � ��
� pstaoffl� n      ��� 4   � ���
� 
cobj� o   � ��� 0 statusindex statusIndex� o   � ��� 0 thisitem thisItem�  � 0 i  � o   � ��� 0 oldindex oldIndex� o   � ��� 0 oldlen oldLen�  � ��� s   ���� o   � �
�
 0 thisitem thisItem� l     ��	� n      ���  ;  � o   �� 0 toreturn toReturn�	  �  �  �  � l  ���  �  
do nothing   � ��� ?  
��� o  
�� 0 oldindex oldIndex� o  �� 0 oldlen oldLen� ��� Z  )����� B  ��� o  �� 0 newindex newIndex� o  �� 0 newlen newLen� r  %��� b  #��� o  � �  0 toreturn toReturn� l "���� n  "��� 7 "����
�� 
cobj� o  ���� 0 newindex newIndex� o  !���� 0 newlen newLen� o  ���� 0 newlist newList��  � o      ���� 0 toreturn toReturn�  � l  ((�����  �  
do nothing   �  �!  � ���� L  .0�� o  ./���� 0 toreturn toReturn��  � ��� l     ������  ��  � ��� i  ����� I      �������� "0 jabberjustlogin jabberJustLogIn��  ��  � L     �� n    ��� I    ������� 0 isjustlogin isJustLogIn� ��� o    ���� &0 jabberservicename jabberServiceName� ���� o    ���� (0 jabberserviceindex jabberServiceIndex��  ��  �  f     � ��� i  ��   I      �������� 0 aimjustlogin aimJustLogin��  ��   L      n     I    ������ 0 isjustlogin isJustLogIn  o    ����  0 aimservicename aimServiceName �� o    ���� "0 aimserviceindex aimServiceIndex��  ��    f     � 	
	 i  �� I      �������� $0 bonjourjustlogin bonjourJustLogIn��  ��   L      n     I    ������ 0 isjustlogin isJustLogIn  o    ���� (0 bonjourservicename bonjourServiceName �� o    ���� *0 bonjourserviceindex bonjourServiceIndex��  ��    f     
  l      ����   0 *
	return delayTime for given serviceIndex
     i  �� I      ������ 0 getdelaytime getDelayTime �� o      ���� 0 serviceindex serviceIndex��  ��   L     
 n     	 4    �� 
�� 
cobj  o    ���� 0 serviceindex serviceIndex o     ���� 0 	delaytime 	delayTime !"! l      ��#��  # > 8
	decrease dealyTime for given serviceIndex by idleTime
   " $%$ i  ��&'& I      ��(���� &0 decreasedelaytime decreaseDelayTime( )��) o      ���� 0 serviceindex serviceIndex��  ��  ' k     3** +,+ r     -.- l    /��/ \     010 l    2��2 n     343 4    ��5
�� 
cobj5 o    ���� 0 serviceindex serviceIndex4 o     ���� 0 	delaytime 	delayTime��  1 o    ���� 0 idletime idleTime��  . n      676 4    ��8
�� 
cobj8 o    ���� 0 serviceindex serviceIndex7 o    ���� 0 	delaytime 	delayTime, 9��9 Z    3:;����: A    "<=< n     >?> 4     ��@
�� 
cobj@ o    ���� 0 serviceindex serviceIndex? o    ���� 0 	delaytime 	delayTime= m     !����  ; r   % /ABA m   % &����  B n      CDC 4   + .��E
�� 
cobjE o   , -���� 0 serviceindex serviceIndexD o   & +���� 0 	delaytime 	delayTime��  ��  ��  % FGF l      ��H��  H � �on zipAndSort(l1, l2) (*as the name imply :) the argument is supposed to be of the form {id list, status message list}*)
	return my sort(my zipList(l1, l2))
end zipAndSort   G IJI l      ��K��  Kic
	zip list1 and list2 return a list of {x1,x2,x3,x4}'s where x1 is in list1 and x2 is in list2 and so on
	the order in which it zip is the order in which it appear in the list1 and list2
	that is the first element get zipped of list1 with the first element of list2 and so on
	kind of invariant: they have the same length
	it's more like intended purpose
   J LML i  ��NON I      ��P���� 0 ziplist zipListP QRQ o      ���� 	0 list1  R STS o      ���� 	0 list2  T UVU o      ���� 	0 list3  V W��W o      ���� 	0 list4  ��  ��  O k     <XX YZY r     [\[ J     ����  \ o      ���� 0 	theresult 	theResultZ ]��] Q    <^_`^ k    2aa bcb Y    /d��ef��d s    *ghg J    'ii jkj n    lml 4    ��n
�� 
cobjn o    ���� 0 i  m o    ���� 	0 list1  k opo n    qrq 4    ��s
�� 
cobjs o    ���� 0 i  r o    ���� 	0 list2  p tut n    !vwv 4    !��x
�� 
cobjx o     ���� 0 i  w o    ���� 	0 list3  u y��y n   ! %z{z 4   " %��|
�� 
cobj| o   # $���� 0 i  { o   ! "���� 	0 list4  ��  h l     }��} n      ~~  ;   ( ) o   ' (���� 0 	theresult 	theResult��  �� 0 i  e m    ���� f n    ��� 1    ��
�� 
leng� o    ���� 	0 list1  ��  c ���� L   0 2�� o   0 1���� 0 	theresult 	theResult��  _ R      ������
�� .ascrerr ****      � ****��  ��  ` L   : <�� o   : ;���� 0 	theresult 	theResult��  M ��� l      �����  � l f sort(list)
	this sort use comparison based on on in split
	The is a recursive function with O(nlog n)   � ��� i  ����� I      ������� 0 sort  � ���� o      ���� 0 l  ��  ��  � Z     9������ B     ��� n     ��� 1    ��
�� 
leng� o     ���� 0 l  � m    ���� � L    
�� o    	���� 0 l  ��  � k    9�� ��� r    ��� n   ��� I    ������� 	0 split  � ��� n    ��� 1    ��
�� 
rest� o    ���� 0 l  � ���� n    ��� 4    ���
�� 
cobj� m    ���� � o    ���� 0 l  ��  ��  �  f    � o      ���� 0 splitted  � ��� l   ������  ��  � ��� L    7�� l   6���� b    6��� b    ,��� l   %��� n   %��� I    %�~��}�~ 0 sort  � ��|� n    !��� 4    !�{�
�{ 
cobj� m     �z�z � o    �y�y 0 splitted  �|  �}  �  f    �  � J   % +�� ��x� n   % )��� 4   & )�w�
�w 
cobj� m   ' (�v�v � o   % &�u�u 0 l  �x  � l  , 5��t� n  , 5��� I   - 5�s��r�s 0 sort  � ��q� n   - 1��� 4   . 1�p�
�p 
cobj� m   / 0�o�o � o   - .�n�n 0 splitted  �q  �r  �  f   , -�t  ��  � ��m� l   8 8�l��l  � ! sortLeft & here & sortRight   �m  � ��� l      �k��k  �.(
	split(list,pivotElement)
	split l p split l in to two parts first part is every element in l that's less than p
	the second part is every thing that's greater(or equal) than p and return {lessList, greatList}
	the comparison is hard coded for efficiency
	invariant: type check or I'll kill you
   � ��� i  ����� I      �j��i�j 	0 split  � ��� o      �h�h 0 l  � ��g� o      �f�f 0 p  �g  �i  � k     @�� ��� r     ��� J     �e�e  � o      �d�d 0 lesslist lessList� ��� r    	��� J    �c�c  � o      �b�b 0 	greatlist 	greatList� ��� Y   
 :��a���`� k    5�� ��� r    ��� n    ��� 4    �_�
�_ 
cobj� o    �^�^ 0 i  � o    �]�] 0 l  � o      �\�\ 0 thisitem thisItem� ��[� Z    5���Z�� A    '��� l   "��Y� n    "��� 4    "�X�
�X 
cobj� m     !�W�W � o    �V�V 0 thisitem thisItem�Y  � l  " &��U� n   " &��� 4   # &�T�
�T 
cobj� m   $ %�S�S � o   " #�R�R 0 p  �U  � l  * .��� s   * .��� o   * +�Q�Q 0 thisitem thisItem� l     ��P� n      ���  ;   , -� o   + ,�O�O 0 lesslist lessList�P  � ! the comparison goes here :)   �Z  � s   1 5��� o   1 2�N�N 0 thisitem thisItem� l     ��M� n          ;   3 4 o   2 3�L�L 0 	greatlist 	greatList�M  �[  �a 0 i  � m    �K�K � n     1    �J
�J 
leng o    �I�I 0 l  �`  � �H L   ; @ J   ; ?  o   ; <�G�G 0 lesslist lessList 	�F	 o   < =�E�E 0 	greatlist 	greatList�F  �H  � 

 l      �D�D   � �
	touch wasOnline and return true if not userwasonline and user is now online
	also touch delay if the user is not online then set delay to waitDelaytime
	otherwise don't touch it
    �C i  �� I      �B�A�B 0 isjustlogin isJustLogIn  o      �@�@ 0 servicename serviceName �? o      �>�> 0 serviceindex serviceIndex�?  �A   Q     � Z    ��= n    I    �<�;�:�<  0 isichatrunning isIChatRunning�;  �:    f     O    � w    �_ k    �  !  r    ""#" l    $�9$ n     %&% 1     �8
�8 
stat& l   '�7' 6  ()( 4   �6*
�6 
icsv* m    �5�5 ) =   +,+ 1    �4
�4 
ID  , o    �3�3 0 servicename serviceName�7  �9  # o      �2�2 0 currentstatus currentStatus! -�1- Z   # �./�00. l  # ,1�/1 n   # ,232 4   ( +�.4
�. 
cobj4 o   ) *�-�- 0 serviceindex serviceIndex3 o   # (�,�, 0 	wasonline 	wasOnline�/  / k   / U55 676 Z   / R89�+:8 =  / 2;<; o   / 0�*�* 0 currentstatus currentStatus< m   0 1�)
�) sstaconn9 l   5 5�(=�(  =  
do nothing   �+  : k   9 R>> ?@? r   9 CABA m   9 :�'
�' boovfalsB l     C�&C n      DED 4   ? B�%F
�% 
cobjF o   @ A�$�$ 0 serviceindex serviceIndexE o   : ?�#�# 0 	wasonline 	wasOnline�&  @ G�"G r   D RHIH o   D I�!�! 0 waitidletime waitIdleTimeI n      JKJ 4   N Q� L
�  
cobjL o   O P�� 0 serviceindex serviceIndexK o   I N�� 0 	delaytime 	delayTime�"  7 M�M L   S UNN m   S T�
� boovfals�  �0  0 Z   X �OP�QO =  X [RSR o   X Y�� 0 currentstatus currentStatusS m   Y Z�
� sstaconnP k   ^ zTT UVU r   ^ hWXW m   ^ _�
� boovtrueX l     Y�Y n      Z[Z 4   d g�\
� 
cobj\ o   e f�� 0 serviceindex serviceIndex[ o   _ d�� 0 	wasonline 	wasOnline�  V ]^] r   i w_`_ o   i n�� 0 waitidletime waitIdleTime` n      aba 4   s v�c
� 
cobjc o   t u�� 0 serviceindex serviceIndexb o   n s�� 0 	delaytime 	delayTime^ d�d L   x zee m   x y�
� boovtrue�  �  Q k   } �ff ghg r   } �iji m   } ~�
� boovfalsj l     k�k n      lml 4   � ��n
� 
cobjn o   � ��
�
 0 serviceindex serviceIndexm o   ~ ��	�	 0 	wasonline 	wasOnline�  h o�o L   � �pp m   � ��
� boovfals�  �1   m    _�=   k   � �qq rsr r   � �tut m   � ��
� boovfalsu l     v�v n      wxw 4   � ��y
� 
cobjy o   � ��� 0 serviceindex serviceIndexx o   � ��� 0 	wasonline 	wasOnline�  s z�z L   � �{{ m   � �� 
�  boovfals�   R      ������
�� .ascrerr ****      � ****��  ��   k   � �|| }~} r   � �� m   � ���
�� boovfals� l     ���� n      ��� 4   � ����
�� 
cobj� o   � ����� 0 serviceindex serviceIndex� o   � ����� 0 	wasonline 	wasOnline��  ~ ���� L   � ��� m   � ���
�� boovfals��  �C       P�������    #���������������������������� ~ � � � �� � � � �� � � � �������� �����������������������������������  � N�������������������������������������������������������������������������������������������������������������������������������������������������������������� 0 idletime idleTime�� 0 waitidletime waitIdleTime�� &0 jabberservicename jabberServiceName��  0 aimservicename aimServiceName�� (0 bonjourservicename bonjourServiceName�� 80 jabbertransportservicename jabberTransportServiceName�� (0 jabberserviceindex jabberServiceIndex�� "0 aimserviceindex aimServiceIndex�� *0 bonjourserviceindex bonjourServiceIndex�� :0 jabbertransportserviceindex jabberTransPortServiceIndex�� 0 onlineindex onlineIndex�� 0 	awayindex 	awayIndex�� 0 	idleindex 	idleIndex�� 0 idindex idIndex�� (0 statusmessageindex statusMessageIndex�� 0 statusindex statusIndex�� 0 	nameindex 	nameIndex�� 0 	delaytime 	delayTime�� 0 lastlist lastList�� 0 	wasonline 	wasOnline�� &0 alreadyregistered alreadyRegistered�� 0 newline  �� 0 appname appName�� &0 aimonlineregister aimOnlineRegister�� "0 aimawayregister aimAwayRegister�� "0 aimidleregister aimIdleRegister�� (0 aimofflineregister aimOfflineRegister��  0 allaimregister allAimRegister�� ,0 jabberonlineregister jabberOnlineRegister�� (0 jabberawayregister jabberAwayRegister�� (0 jabberidleregister jabberIdleRegister�� .0 jabberofflineregister jabberOfflineRegister�� &0 alljabberregister allJabberRegister�� >0 jabbertransportonlineregister jabberTransportOnlineRegister�� :0 jabbertransportawayregister jabberTransportAwayRegister�� :0 jabbertransportidleregister jabberTransportIdleRegister�� @0 jabbertransportofflineregister jabberTransportOfflineRegister�� 80 alljabbertransportregister allJabberTransportRegister�� .0 bonjouronlineregister bonjourOnlineRegister�� *0 bonjourawayregister bonjourAwayRegister�� *0 bonjouridleregister bonjourIdleRegister�� 00 bonjourofflineregister bonjourOfflineRegister�� (0 allbonjourregister allBonjourRegister�� 0 allregister allRegister�� 0 
dummyblank 
dummyBlank�� 0 
appversion 
appVersion�� 0 ichatversion iChatVersion�� &0 ichattigerversion iChatTigerVersion�� 0 fail  �� 0 pass  
�� .aevtoappnull  �   � ****
�� .miscidlenmbr    ��� null�� &0 registerwithgrowl registerWithGrowl�� 0 	dopanther 	doPanther�� 0 dotiger doTiger�� 0 
mainnotify 
mainNotify�� 
0 notify  �� *0 getnotificationname getNotificationName�� "0 stringforstatus stringForStatus��  0 isichatrunning isIChatRunning��  0 isgrowlrunning isGrowlRunning�� &0 isjabbertransport isJabberTransport�� 0 gettigerlist getTigerList��  0 getpantherlist getPantherList�� 00 getavailablejabberlist getAvailableJabberList�� *0 getavailableaimlist getAvailableAimList�� 20 getavailablebonjourlist getAvailableBonjourList�� $0 getavailablelist getAvailableList�� 0 getnotifylist getNotifyList�� "0 jabberjustlogin jabberJustLogIn�� 0 aimjustlogin aimJustLogin�� $0 bonjourjustlogin bonjourJustLogIn�� 0 getdelaytime getDelayTime�� &0 decreasedelaytime decreaseDelayTime�� 0 ziplist zipList�� 0 sort  �� 	0 split  �� 0 isjustlogin isJustLogIn�� �� �� �� �� �� �� �� �� �� �� �� �� � ����� �  ����������  ��  ��  ��  � ����� �  ����� ������  ��  � ������  ��  � ������  ��  � ������  ��  � ����� �  ��������
�� boovfals
�� boovfals
�� boovfals
�� boovfals
�� boovfals�  
   � ����� �   � � � �� ����� �   � � � �� ����� �   � � � ��  Bonjour online status   �  Bonjour away status   �  Bonjour idle status   �  Bonjouroffline status   � ����� �  ����� ��� �   � � � � � � � � � � � �������  �� � �~�}�|���{
�~ .aevtoappnull  �   � ****�}  �|  �  � �z_�y8�x�w�v�u�t�s�r�z  0 isichatrunning isIChatRunning
�y 
vers�x  0 getpantherlist getPantherList�w $0 bonjourjustlogin bonjourJustLogIn�v "0 jabberjustlogin jabberJustLogIn�u 0 aimjustlogin aimJustLogin�t 0 gettigerlist getTigerList�s  �r  �{ � z)j+   g� _*�,Ec  .Ob  .b  / *�Ec  O)j+ Ec  O)j+ O)j+ O)j+ Y )j+ Ec  O)j+ O)j+ O)j+ UY hOb  W X 	 
b  � �qh�p�o���n
�q .miscidlenmbr    ��� null�p  �o  �  � �m�l�k�j�i�h�m &0 registerwithgrowl registerWithGrowl�l 0 	dopanther 	doPanther�k 0 dotiger doTiger�j  �i  �h �n k Mb   )j+  b  0  b   Y hY hOb  .b  / 
)j+ Y )j+ Ob   W X  jvjvjvjv�vEc  Ob   � �g��f�e���d�g &0 registerwithgrowl registerWithGrowl�f  �e  � �c�b�c 0 defaultnotifs defaultNotifs�b 
0 notifs  � �a�`_�_������^�]�\�[�Z�Y�X<�a  0 isgrowlrunning isGrowlRunning�`  0 isichatrunning isIChatRunning
�_ 
vers�^ 
�] 
appl
�\ 
anot
�[ 
dnot
�Z 
iapp�Y 
�X .registernull��� ��� null�d)j+  )j+  � *�,Ec  .UY b  0Ob  .b  / ��Ec  Ob  �%Ec  &Ob  �%Ec  'Ob  �%Ec  (Ob  �%Ec  )Ob  &b  'b  (b  )�vEc  *Ob  b  *%Ec  +O� !b  +E�O�E�O*�b  �����a  UOeEc  Ob  1Y 7� #b  +E�O�E�O*�b  ����a a  UOeEc  Ob  1Y b  0� �WJ�V�U���T�W 0 	dopanther 	doPanther�V  �U  � �S�S 0 alllist allList� �R�Q�P�O�N�M�R  0 getpantherlist getPantherList
�Q 
cobj�P �O 0 
mainnotify 
mainNotify�N  �M  �T ] T*j+  E�O)��b  /b  �b  /b  b  �+ O)��b  /b  �b  /b  b  �+ W 	X  h� �L|�K�J���I�L 0 dotiger doTiger�K  �J  � �H�H 0 alllist allList� �G�F�E�D�C�B�G 0 gettigerlist getTigerList
�F 
cobj�E �D 0 
mainnotify 
mainNotify�C  �B  �I � �*j+  E�O)��b  /b  �b  /b  b  �+ O)��b  /b  �b  /b  b  �+ O)��b  /b  �b  /b  b  �+ O)��b  	/b  �b  	/b  	b  �+ W 	X  h� �A��@�?���>�A 0 
mainnotify 
mainNotify�@ �=��= �  �<�;�:�9�< 0 newlist newList�; 0 oldlist oldList�: 0 serviceindex serviceIndex�9 0 servicename serviceName�?  � �8�7�6�5�4�3�2�1�8 0 newlist newList�7 0 oldlist oldList�6 0 serviceindex serviceIndex�5 0 servicename serviceName�4 $0 accountjustlogin accountJustLogin�3 0 
changelist 
changeList�2 0 i  �1 0 thisuser thisUser� �0�/�.�-�,�+�*�)�(�'�&�0  0 isichatrunning isIChatRunning�/ 0 isjustlogin isJustLogIn�. 0 getdelaytime getDelayTime�- &0 decreasedelaytime decreaseDelayTime�, 0 getnotifylist getNotifyList
�+ 
leng
�* 
cobj�) �( 
0 notify  �'  �&  �> � �)j+   �)��l+ E�O)�k+ j )�k+ OhY c� hY [)��l+ E�O��,j  hY hO ?k��,Ekh ��/E�O)��b  /��b  /��b  /��b  /���+ [OY��O�b  �/FY jvb  �/FW X 	 
jvb  �/FOh� �%q�$�#���"�% 
0 notify  �$ �!��! �  � ������  0 thisid thisId� 0 
thisstatus 
thisStatus� &0 thisstatusmessage thisStatusMessage� 0 thisname thisName� 0 servicename serviceName� 0 serviceindex serviceIndex�#  � 
����������� 0 thisid thisId� 0 
thisstatus 
thisStatus� &0 thisstatusmessage thisStatusMessage� 0 thisname thisName� 0 servicename serviceName� 0 serviceindex serviceIndex� 0 thename theName� 0 	thestatus 	theStatus� $0 notificationname notificationName� 0 
displaypic 
displayPic� ��_�����
��	��������� �����  0 isgrowlrunning isGrowlRunning�  0 isichatrunning isIChatRunning� "0 stringforstatus stringForStatus
� pstaaway� *0 getnotificationname getNotificationName
� 
icsv
�
 
pres�  
�	 
ID  
� 
imaA
� 
name
� 
titl
� 
appl
� 
desc
� 
imag� 

� .notifygrnull��� ��� null�   ��  �� �"
)j+   �)j+  �� �E�O)�k+ E�O�b  	 ��  �b  %�%E�Y hY �E�O)��l+ E�O C)j+  6*�/�k/�[�,\Z�81�,E�O� *����b  �a �a  UY hW iX   7)j+  **�/�,E�O� *����b  �a �a  UY hW ,X   � *����b  �a  UW 	X  hUY hY hW 	X  h� ������������ *0 getnotificationname getNotificationName�� ����� �  ������ 0 serviceindex serviceIndex�� 0 	thestatus 	theStatus��  � ������ 0 serviceindex serviceIndex�� 0 	thestatus 	theStatus� ��_��������?c������  0 isichatrunning isIChatRunning
�� pstaaway
�� pstaoffl
�� pstaaval
�� pstaidle��>*j+  5�Z�b    C��  b  Y 1��  b  Y "��  b  Y ��  b  Y �Y �b    C��  b  Y 1��  b  Y "��  b  Y ��  b  Y �Y ��b    C��  b  'Y 1��  b  )Y "��  b  &Y ��  b  (Y �Y O�b  	  C��  b  "Y 1��  b  $Y "��  b  !Y ��  b  #Y �Y �Y �� ������������� "0 stringforstatus stringForStatus�� ����� �  ���� 0 s  ��  � ���� 0 s  � ��_���������������������  0 isichatrunning isIChatRunning
�� pstaaway
�� pstaoffl
�� pstaaval
�� pstaidle��  ��  �� K B*j+   5�Z��  �Y %��  �Y ��  �Y ��  �Y �Y �W 	X  �� �������������  0 isichatrunning isIChatRunning��  ��  �  � ����������
�� 
prcs
�� .coredoexbool       obj ��  ��  ��  � *��/j UW 	X  f� �������������  0 isgrowlrunning isGrowlRunning��  ��  �  � ���������
�� 
prcs
�� .coredoexbool       obj ��  ��  ��  � *��/j UW 	X  f� ������������ &0 isjabbertransport isJabberTransport�� ����� �  ��
�� 
ID  ��  � ��
�� 
ID  � �� ��� ������������ 0 gettigerlist getTigerList��  ��  � ������������ 0 
jabberlist 
jabberList�� *0 jabbertransportlist jabberTransportList��  0 realjabberlist realJabberList�� 0 i  �� 0 thiselement thisElement� ������<���������� 00 getavailablejabberlist getAvailableJabberList
�� 
leng
�� 
cobj�� 0 sort  �� *0 getavailableaimlist getAvailableAimList�� 20 getavailablebonjourlist getAvailableBonjourList�� �� h*j+  E�OjvE�OjvE�O 0k��,Ekh ��/E�O��b  /� 	��6GY ��6G[OY��O)�k+ ))j+ k+ ))j+ k+ )�k+ �v� ��o����������  0 getpantherlist getPantherList��  ��  �  � ���������� *0 getavailableaimlist getAvailableAimList�� 0 sort  �� 20 getavailablebonjourlist getAvailableBonjourList�� �� jv))j+  k+ ))j+ k+ jv�v� ������������� 00 getavailablejabberlist getAvailableJabberList��  ��  �  � ���� $0 getavailablelist getAvailableList�� )b  k+  � ������������� *0 getavailableaimlist getAvailableAimList��  ��  �  � ���� $0 getavailablelist getAvailableList�� )b  k+  � ������������� 20 getavailablebonjourlist getAvailableBonjourList��  ��  �  � ���� $0 getavailablelist getAvailableList�� )b  k+  � ������������� $0 getavailablelist getAvailableList�� ����� �  ���� 0 servicename serviceName��  � ������ 0 servicename serviceName�� 0 thelist theList� ��_���������������������������  0 isichatrunning isIChatRunning
�� 
icsv
�� 
pres
�� 
stat
�� pstaoffl
�� 
ID  
�� 
smsg
�� 
pnam�� 
�� 
cobj�� 0 ziplist zipList��  ��  �� m c)j+   U� M*�/�-�[�,\Z�91[�,\[�,\[�,\[�,\Z�vE�O)��b  /��b  /��b  /��b  /�+ UY jvW 
X  jv� ������������� 0 getnotifylist getNotifyList�� ����� �  ������ 0 newlist newList�� 0 oldlist oldList��  � ������������������~�}�|�{�z�y�� 0 newlist newList�� 0 oldlist oldList�� 0 newindex newIndex�� 0 oldindex oldIndex�� 0 toreturn toReturn�� 0 newlen newLen�� 0 oldlen oldLen�� 0 newitem newItem� 0 olditem oldItem�~ 0 newname newName�} 0 oldname oldName�| 0 	newstatus 	newStatus�{ 0 	oldstatus  �z 0 i  �y 0 thisitem thisItem� �x�w�v_�u
�x 
leng
�w 
bool
�v 
cobj
�u pstaoffl��1kE�OkE�OjvE�O��,E�O��,E�O�j  �Y hO�j  �Y hO �h��	 ���&��/E�O��/E�O��b  /E�O��b  /E�O��  5��b  /E�O��b  /E�O�� 	��6GY hO�kE�O�kE�Y ,�� ��6GO�kE�Y �Z��b  /FO��6GO�kE�[OY�jO�� 6�� ,�Z ��kh ��/E�O��b  /F[OY��O��6GY hY %�� �� ��[�\[Z�\Z�2%E�Y hY hO�� �t��s�r���q�t "0 jabberjustlogin jabberJustLogIn�s  �r  �  � �p�p 0 isjustlogin isJustLogIn�q )b  b  l+  � �o�n�m���l�o 0 aimjustlogin aimJustLogin�n  �m  �  � �k�k 0 isjustlogin isJustLogIn�l )b  b  l+  � �j�i�h���g�j $0 bonjourjustlogin bonjourJustLogIn�i  �h  �  � �f�f 0 isjustlogin isJustLogIn�g )b  b  l+  � �e�d�c���b�e 0 getdelaytime getDelayTime�d �a��a �  �`�` 0 serviceindex serviceIndex�c  � �_�_ 0 serviceindex serviceIndex� �^
�^ 
cobj�b b  �/E� �]'�\�[���Z�] &0 decreasedelaytime decreaseDelayTime�\ �Y��Y �  �X�X 0 serviceindex serviceIndex�[  � �W�W 0 serviceindex serviceIndex� �V
�V 
cobj�Z 4b  �/b   b  �/FOb  �/j jb  �/FY h� �UO�T�S���R�U 0 ziplist zipList�T �Q��Q �  �P�O�N�M�P 	0 list1  �O 	0 list2  �N 	0 list3  �M 	0 list4  �S  � �L�K�J�I�H�G�L 	0 list1  �K 	0 list2  �J 	0 list3  �I 	0 list4  �H 0 	theresult 	theResult�G 0 i  � �F�E�D�C�B
�F 
leng
�E 
cobj�D �C  �B  �R =jvE�O / &k��,Ekh ��/��/��/��/�v�6G[OY��O�W 	X  �� �A��@�?���>�A 0 sort  �@ �=��= �  �<�< 0 l  �?  � �;�:�; 0 l  �: 0 splitted  � �9�8�7�6�5
�9 
leng
�8 
rest
�7 
cobj�6 	0 split  �5 0 sort  �> :��,k �Y .)��,��k/l+ E�O)��k/k+ ��k/kv%)��l/k+ %OP� �4��3�2���1�4 	0 split  �3 �0��0 �  �/�.�/ 0 l  �. 0 p  �2  � �-�,�+�*�)�(�- 0 l  �, 0 p  �+ 0 lesslist lessList�* 0 	greatlist 	greatList�) 0 i  �( 0 thisitem thisItem� �'�&
�' 
leng
�& 
cobj�1 AjvE�OjvE�O /k��,Ekh ��/E�O��k/��k/ 	��6GY ��6G[OY��O��lv� �%�$�#	 	�"�% 0 isjustlogin isJustLogIn�$ �!	�! 	  � ��  0 servicename serviceName� 0 serviceindex serviceIndex�#  	  ���� 0 servicename serviceName� 0 serviceindex serviceIndex� 0 currentstatus currentStatus	 
�_���������  0 isichatrunning isIChatRunning
� 
icsv
� 
ID  
� 
stat
� 
cobj
� sstaconn�  �  �" � �)j+   �� }�Z*�k/�[�,\Z�81�,E�Ob  �/E +��  hY fb  �/FOb  b  �/FOfY 4��  !eb  �/FOb  b  �/FOeY fb  �/FOfUY fb  �/FOfW X  	fb  �/FOf ascr  ��ޭ