Vim�UnDo� 7��q]�LFG��N�-rr��~��!�~ҵ6��                                      c��    _�                             ����                                                                                                                                                                                                                                                                                                                                                  V        c��     �                 -- migrate:up   #ALTER TABLE public.accounts_profile       ADD COLUMN first_name text,       ADD COLUMN last_name text;       WITH profile_users AS (   
    SELECT           au.profile_id pid,   !        au.first_name first_name,           au.last_name last_name       FROM   '        public.accounts_profile profile   ?        JOIN public.auth_user au ON au.profile_id = profile.id)   UPDATE       public.accounts_profile ap   SET       first_name = pu.first_name,       last_name = pu.last_name   FROM       profile_users pu   WHERE       pu.pid = ap.id;       -- migrate:down   #ALTER TABLE public.accounts_profile       DROP first_name, last_name5��                          2                      �                          N                      �                         �                     �                         �                     �                         �                     �    	                     �                     �    
                     �                     �                         �                     �                         �                     �                          ?                     �                          ^                     �                          z                     �                          �                     �                          �                     �                          �                     5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        c��    �                 ADD COLUMN first_name text,   ADD COLUMN last_name text;       WITH profile_users AS (     SELECT     au.profile_id pid,     au.first_name first_name,     au.last_name last_name     FROM   !  public.accounts_profile profile   9  JOIN public.auth_user au ON au.profile_id = profile.id)   UPDATE   public.accounts_profile ap   SET   first_name = pu.first_name,   last_name = pu.last_name   FROM   profile_users pu   WHERE   pu.pid = ap.id;       -- migrate:down   #ALTER TABLE public.accounts_profile   DROP first_name, last_name5��                        2       �            5��