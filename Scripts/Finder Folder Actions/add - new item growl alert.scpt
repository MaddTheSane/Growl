FasdUAS 1.101.10   ��   ��    k             l      �� ��   NH
New Item Alert


For the Folder Notification scripts to work, they have to be placed in "Scripts/Folder Action Scripts" ... either in /Library or ~/Library. After placing them there, right-click on the folder for which you want notifications and choose "Attach a Folder Action."



Based on ADD - NEW ITEM ALERT (�2002 Apple Computer)

This Folder Action script is designed for use with Mac OS X version 10.2 and higher.

This Folder Action handler is triggered whenever items are added to the attached folder.  The script will display an alert 
containing the number of items added
       	  l     ������  ��   	  
  
 i         I     ��  
�� .facofget****      � ****  o      ���� 0 this_folder    �� ��
�� 
flst  o      ���� 0 added_items  ��    Q     \  ��  k    S       O        k           l   �� ��    !  get the name of the folder      ��  r        l   
 ��  n    
   !   1    
��
�� 
pnam ! o    ���� 0 this_folder  ��    l      "�� " o      ���� 0 folder_name  ��  ��    m     # #�null     ߀��  �
Finder.app��`    �%P<����ր���� }�0   )       �6(�$|���ְ ~MACS   alis    f  vivibook                   ��.mH+    �
Finder.app                                                       Cp�g~5        ����  	                CoreServices    ��f�      �gą      �  �  �  /vivibook:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    v i v i b o o k  &System/Library/CoreServices/Finder.app  / ��     $ % $ l   ������  ��   %  & ' & l   �� (��   ( 4 . figure out the phrasology of the notification    '  ) * ) r     + , + l    -�� - n     . / . m    ��
�� 
nmbr / n    0 1 0 2   ��
�� 
cobj 1 l    2�� 2 o    ���� 0 added_items  ��  ��   , l      3�� 3 o      ���� 0 
item_count  ��   *  4 5 4 Z    - 6 7�� 8 6 ?    9 : 9 l    ;�� ; o    ���� 0 
item_count  ��   : m    ����  7 k    # < <  = > = r     ? @ ? m     A A  s    @ o      ���� 0 	plurality   >  B�� B r     # C D C m     ! E E 
 have    D o      ���� 0 	have_verb  ��  ��   8 k   & - F F  G H G r   & ) I J I m   & ' K K       J o      ���� 0 	plurality   H  L�� L r   * - M N M m   * + O O 	 has    N o      ���� 0 	have_verb  ��   5  P Q P l  . .������  ��   Q  R S R l  . .�� T��   T   build notification text    S  U V U r   . 7 W X W b   . 5 Y Z Y b   . 3 [ \ [ b   . 1 ] ^ ] m   . / _ _  New File    ^ o   / 0���� 0 	plurality   \ m   1 2 ` ` 
  in     Z l  3 4 a�� a o   3 4���� 0 folder_name  ��   X o      ���� 0 thetitle theTitle V  b c b r   8 G d e d b   8 E f g f b   8 C h i h b   8 A j k j b   8 ? l m l b   8 = n o n l  8 ; p�� p c   8 ; q r q l  8 9 s�� s o   8 9���� 0 
item_count  ��   r m   9 :��
�� 
ctxt��   o m   ; < t t   item    m o   = >���� 0 	plurality   k m   ? @ u u       i o   A B���� 0 	have_verb   g m   C D v v   been added    e o      ���� 0 thetext theText c  w x w l  H H������  ��   x  y z y l  H H�� {��   {   rawr!    z  | } | I   H Q�� ~���� *0 dofolderactiongrowl doFolderActionGrowl ~   �  m   I J � �  New Item    �  � � � o   J K���� 0 thetitle theTitle �  � � � o   K L���� 0 thetext theText �  ��� � o   L M���� 0 this_folder  ��  ��   }  ��� � l  R R������  ��  ��    R      ������
�� .ascrerr ****      � ****��  ��  ��     � � � l     ������  ��   �  ��� � i     � � � I      �� ����� *0 dofolderactiongrowl doFolderActionGrowl �  � � � o      ���� 0 	notifname 	notifName �  � � � o      ���� 0 thetitle theTitle �  � � � o      ���� 0 thetext theText �  ��� � o      ���� *0 thefilefornotificon theFileForNotifIcon��  ��   � k     2 � �  � � � l     ������  ��   �  � � � r      � � � m      � �  Folder Actions    � o      ���� 0 appname appName �  � � � r     � � � m     � �  Folder Actions Setup    � o      ���� 0 appicon appIcon �  � � � r     � � � J     � �  ��� � m    	 � �  New Item   ��   � o      ���� 0 	allnotifs 	allNotifs �  � � � l   ������  ��   �  � � � O    0 � � � k    / � �  � � � I   ���� �
�� .registernull��� ��� null��   � �� � �
�� 
appl � o    ���� 0 appname appName � �� � �
�� 
anot � o    ���� 0 	allnotifs 	allNotifs � �� � �
�� 
dnot � o    ���� 0 	allnotifs 	allNotifs � �� ���
�� 
iapp � o    ���� 0 appicon appIcon��   �  ��� � I    /���� �
�� .notifygrnull��� ��� null��   � �� � �
�� 
name � o   " #���� 0 	notifname 	notifName � �� � �
�� 
titl � o   $ %���� 0 thetitle theTitle � �� � �
�� 
appl � o   & '���� 0 appname appName � �� � �
�� 
desc � o   ( )���� 0 thetext theText � �� ���
�� 
ifil � o   * +���� *0 thefilefornotificon theFileForNotifIcon��  ��   � m     � �&null     ߀�� ��GrowlHelperApp.app%P<������  � }�@   )       �6(�$|����� ~GRRR   alis    �  vivibook                   ��.mH+   ��GrowlHelperApp.app                                              �޾�j�        ����  	                	Resources     ��f�      ���3     �� �� ��     Uvivibook:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    v i v i b o o k  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��   �  ��� � l  1 1������  ��  ��  ��       �� � � ���   � ����
�� .facofget****      � ****�� *0 dofolderactiongrowl doFolderActionGrowl � �� ���� � ���
�� .facofget****      � ****�� 0 this_folder  �� ������
�� 
flst�� 0 added_items  ��   � ��������������~�� 0 this_folder  �� 0 added_items  �� 0 folder_name  �� 0 
item_count  �� 0 	plurality  �� 0 	have_verb  � 0 thetitle theTitle�~ 0 thetext theText �  #�}�|�{ A E K O _ `�z t u v ��y�x�w�v
�} 
pnam
�| 
cobj
�{ 
nmbr
�z 
ctxt�y �x *0 dofolderactiongrowl doFolderActionGrowl�w  �v  �� ] U� ��,E�UO��-�,E�O�k �E�O�E�Y 	�E�O�E�O�%�%�%E�O��&�%�%�%�%�%E�O*��+ OPW X  h � �u ��t�s � ��r�u *0 dofolderactiongrowl doFolderActionGrowl�t �q ��q  �  �p�o�n�m�p 0 	notifname 	notifName�o 0 thetitle theTitle�n 0 thetext theText�m *0 thefilefornotificon theFileForNotifIcon�s   � �l�k�j�i�h�g�f�l 0 	notifname 	notifName�k 0 thetitle theTitle�j 0 thetext theText�i *0 thefilefornotificon theFileForNotifIcon�h 0 appname appName�g 0 appicon appIcon�f 0 	allnotifs 	allNotifs �  � � � ��e�d�c�b�a�`�_�^�]�\�[�Z
�e 
appl
�d 
anot
�c 
dnot
�b 
iapp�a 
�` .registernull��� ��� null
�_ 
name
�^ 
titl
�] 
desc
�\ 
ifil�[ 

�Z .notifygrnull��� ��� null�r 3�E�O�E�O�kvE�O� *����� 	O*������� UOPascr  ��ޭ