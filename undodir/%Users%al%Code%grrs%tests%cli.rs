Vim�UnDo� ɋ��3yx�%�G��cq�Coj��rbl��   "   @        .stdout(predicate::str::contains("A test").from_utf8());      0      4       4   4   4    c:%]   	 _�                             ����                                                                                                                                                                                                                                                                                                                                                             c9&g     �                   5��                                                  �                                                �                                                �                        ,                     �                        1                     �                         7                      �                          8                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c9&�     �                use assert_cmd::prelude::*;5��                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c9&�     �               use predicates::prelude::*;5��                         R                      �       4                  k                      �       2                 i                     �       :                 q                       �                         �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c9&�     �                                            //5��                          r                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c9&�     �                 use std::process::Command;�               5��                         �                      5�_�                       )    ����                                                                                                                                                                                                                                                                                                                                                             c9&�     �                                            // �               5��                          �                      �                         �                      �                          �                      �                          �                      �                          �                      �                         �                      �                          �                      �                        �                     �                     +   �              +       �       B                  �                      �                          �                      �                        �                     �                                            �                                            �       .                                      �                                               �                                              �                                              �                     "   )             "       5�_�                    	   %    ����                                                                                                                                                                                                                                                                                                                                                             c9&�     �                 2    cmd.arg("foobar").arg("test/file/doesnt/exist"5��       %                  >                     5�_�      	              	   0    ����                                                                                                                                                                                                                                                                                                                                                             c9&�     �                 7    cmd.arg("foobar").arg("test/file/that/doesnt/exist"5��       /                  H                     �       .                  G                     �       -                 F                    5�_�      
           	   	   .    ����                                                                                                                                                                                                                                                                                                                                                             c9&�     �                 5    cmd.arg("foobar").arg("test/file/that/does/exist"5��       .                  G                     5�_�   	              
   	   9    ����                                                                                                                                                                                                                                                                                                                                                             c9&�    �                 9    cmd.arg("foobar").arg("test/file/that/does/not/exist"5��       9                  R                     �       ;                 T                     �    	                     Y                     �    	                    e                     �    
                     f                    �    
                    x              	       �                      9   �              9       5�_�   
                    @    ����                                                                                                                                                                                                                                                                                                                                                             c9':    �                     �               5��                          �              	       �                         �                    �                          �                     �                         �                     �                         �                     �       
                 �                     �                      	   �             	       �                         �                    �                         �                     �                         �                    5�_�                       *    ����                                                                                                                                                                                                                                                                                                                                                             c9'�    �               A        .stderr(predicate::str::contains("could not read file"));5��       *                 �                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c9'�    �                �             5��                          �                      �                          �                      �                        �                     �       #                  �                      �       "                  �                      �       !                 �                     �       "                  �                      �       !                 �                     5�_�                       8    ����                                                                                                                                                                                                                                                                                                                                                             c9'�     �             5��                          �                      �                         �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c9'�     �               //5��                         �                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c9'�     �               /5��                          �                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c9'�     �                9// TODO: Add integration test for empty string as pattern5��                          �       :               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c9'�     �               �               5��                          �              :       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c9'�     �             5��                          �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c9'�     �               5��                                               �                                              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c9'�     �                 //5��                                              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c9'�     �                /5��                                               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c9'�     �                 9// TODO: Add integration test for empty string as pattern5��                          �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c9(     �                 8/ TODO: Add integration test for empty string as pattern5��                          �                     �                          �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c9(    �                     6TODO: Add integration test for empty string as pattern�                 8/ TODO: Add integration test for empty string as pattern5��                         �                     �                          �                     �                          �                     �                          �                     �                          �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c9(#    �                �             5��                          �                     �                          �                     �                       
   �              
       �       	                  �                     5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                                             c9(0     �               5��                          0                     �                         2                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c9(1     �                 //5��                          0                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c9(2     �                 /5��                          0                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c9+    �               9// TODO: Add integration test for empty string as pattern5��                        �                    5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             c:$�     �                )// TODO: "Generating test files" exercise5��                          �      *               5�_�      !                       ����                                                                                                                                                                                                                                                                                                                                                             c:$�     �             5��                          �                     5�_�       "           !           ����                                                                                                                                                                                                                                                                                                                                                             c:$�     �               #    let file = assert_fs::NamedTemp�             �             �                �             �             5��                          �                     �                          �                     �                         �                     �                          �                     �                        �                    �                        �                    �                        �                    �                        �                    �                        �                    �                     '   �             '       �       E                                       �                                               �                        7                    �       #                  =                     �       "                  <                     �       !                  ;                     �                          :                     �                         9                     �                         8                     �                         7                     �                         6                     �                         5                     �                         4                     �       9                  S                     �       8                  R                     �       %                  ?                     �       $                  >                     �       #                  =                     �       "                  <                     �       !                  ;                     �                          :                     �                         9                     �                         8                     �                         7                     �                         6                     �                         5                     �                        4                    �       %                 ?                     �                         @                    �                         G                     �                         F                     �                         E                     �                         D                     �                         C                     �                         B                     �                         A                     �                          @                     �       %                  ?                     �       $                  >                     �       #                  =                     �       "                  <                     �       !                  ;                     �                          :                     �                         9                     �                         8                     �                         7                     �                         6                     �                         5                     �                        4                    �       $                  >                     �       #                  =                     �       "                  <                     �       !                  ;                     �                          :                     �                         9                     �                         8                     �                         7                     �                         6                     �                         5                     �                        4                    �       *                  D                     �       )                 C                    5�_�   !   #           "      /    ����                                                                                                                                                                                                                                                                                                                                                             c:$�     �               :    let file = assert_fs::NamedTempFile::new("test.txt")?;5��       /                 I                    �       .                 H                    5�_�   "   $           #      :    ����                                                                                                                                                                                                                                                                                                                                                             c:$�     �                   �             �             5��                          W                     �                         [                     5�_�   #   %           $          ����                                                                                                                                                                                                                                                                                                                                                             c:$�     �               #    file.write_str("hello world")?;5��                        k                    �       *                 �                    �       *                 �                    �       :                 �                    �       A                 �                    �       F                  �                     5�_�   $   &           %      E    ����                                                                                                                                                                                                                                                                                                                                                             c:%     �                   �             5��                          �                     �                         �                    5�_�   %   '           &           ����                                                                                                                                                                                                                                                                                                                                                             c:%     �                   �             �                   �             �                   let�             �                   �             5��                          �                     �                          �                     �                         �                     �                      *   �              *       �       .                 �                     �                      !   �              !       �       %                 �                     �                     @   �              `       5�_�   &   (           '      0    ����                                                                                                                                                                                                                                                                                                                                                             c:%1     �         "          �         "    �         !          �              5��                          ]              	       �                         ]                    �                          ]                     �                         ]                     �                         b                     5�_�   '   )           (      0    ����                                                                                                                                                                                                                                                                                                                                                             c:%R     �         "      @        .stdout(predicate::str::contains("A test").from_utf8());5��       0                  L                     5�_�   (   *           )      @    ����                                                                                                                                                                                                                                                                                                                                                             c:%Y     �         "      N        .stdout(predicate::str::contains("A test\nAnother test").from_utf8());5��       @                  \                     5�_�   )   +           *      @    ����                                                                                                                                                                                                                                                                                                                                                             c:%Z     �         "      M        .stdout(predicate::str::contains("A test\nAnother test")from_utf8());5��       @                  \                     5�_�   *   ,           +      @    ����                                                                                                                                                                                                                                                                                                                                                             c:%[     �         "      L        .stdout(predicate::str::contains("A test\nAnother test")rom_utf8());5��       @                  \                     5�_�   +   -           ,      @    ����                                                                                                                                                                                                                                                                                                                                                             c:%[     �         "      K        .stdout(predicate::str::contains("A test\nAnother test")om_utf8());5��       @                  \                     5�_�   ,   .           -      @    ����                                                                                                                                                                                                                                                                                                                                                             c:%[     �         "      J        .stdout(predicate::str::contains("A test\nAnother test")m_utf8());5��       @                  \                     5�_�   -   /           .      @    ����                                                                                                                                                                                                                                                                                                                                                             c:%[     �         "      I        .stdout(predicate::str::contains("A test\nAnother test")_utf8());5��       @                  \                     5�_�   .   0           /      @    ����                                                                                                                                                                                                                                                                                                                                                             c:%[     �         "      H        .stdout(predicate::str::contains("A test\nAnother test")utf8());5��       @                  \                     5�_�   /   1           0      @    ����                                                                                                                                                                                                                                                                                                                                                             c:%[     �         "      G        .stdout(predicate::str::contains("A test\nAnother test")tf8());5��       @                  \                     5�_�   0   2           1      @    ����                                                                                                                                                                                                                                                                                                                                                             c:%\     �         "      F        .stdout(predicate::str::contains("A test\nAnother test")f8());5��       @                  \                     5�_�   1   3           2      @    ����                                                                                                                                                                                                                                                                                                                                                             c:%\     �         "      E        .stdout(predicate::str::contains("A test\nAnother test")8());5��       @                  \                     5�_�   2   4           3      @    ����                                                                                                                                                                                                                                                                                                                                                             c:%\     �         "      D        .stdout(predicate::str::contains("A test\nAnother test")());5��       @                  \                     5�_�   3               4      @    ����                                                                                                                                                                                                                                                                                                                                                             c:%\   	 �         "      C        .stdout(predicate::str::contains("A test\nAnother test")));5��       @                  \                     5��