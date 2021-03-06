unit globals;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,   resource, versiontypes, versionresource;

var
  DBType : string ;
  DBVersion : integer ;
  UserName : string ;
  ComputerName : string ;
  DNSDomain : string ;
  UserAccessLevel : integer ;
  ExitApplication : boolean ;

  tAccount_ID : integer ;
  tOrganization_ID : integer ;
  tProject_ID : integer ;
  tProjectConfig_ID : integer ;


implementation

 FUNCTION resourceVersionInfo: STRING;

 (* Unlike most of AboutText (below), this takes significant activity at run-    *)
 (* time to extract version/release/build numbers from resource information      *)
 (* appended to the binary.                                                      *)

 VAR     Stream: TResourceStream;
         vr: TVersionResource;
         fi: TVersionFixedInfo;

 BEGIN
   RESULT:= '';
   TRY

 (* This raises an exception if version info has not been incorporated into the  *)
 (* binary (Lazarus Project -> Project Options -> Version Info -> Version        *)
 (* numbering).                                                                  *)

     Stream:= TResourceStream.CreateFromID(HINSTANCE, 1, PChar(RT_VERSION));
     TRY
       vr:= TVersionResource.Create;
       TRY
         vr.SetCustomRawDataStream(Stream);
         fi:= vr.FixedInfo;
         RESULT := 'Version ' + IntToStr(fi.FileVersion[0]) + '.' + IntToStr(fi.FileVersion[1]) +
                ' release ' + IntToStr(fi.FileVersion[2]) + ' build ' + IntToStr(fi.FileVersion[3]) ;
         vr.SetCustomRawDataStream(nil)
       FINALLY
         vr.Free
       END
     FINALLY
       Stream.Free
     END
   EXCEPT
   END
 END { resourceVersionInfo } ;

end.

