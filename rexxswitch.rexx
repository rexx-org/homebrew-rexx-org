#!/usr/bin/env rexx
/*
 * This program enables switching the active Rexx related package to the specified interpreter under HomeBrew.
 * Where a package is available for both Regina and ooRexx, the 2 conflicting packages can be installed at the
 * same time but can't be active at the same time. This program simplifies the switch.
 *
 * The HomeBrew mechanism is to unlink the active package and then link the other package.
 *
 * Usage:
 *  switchrexx regina|oorexx all|package[ package[...]]
 */
Parse Arg int packages
interpreters = 'regina oorexx'
If Wordpos( int, interpreters ) = 0 Then
   Do
      Say 'Invalid interpreter argumant supplied:' int'. Must be one of' interpreters
      Exit 1
   End
Address System 'brew list -1' With Output Stem list.
-- get all Rexx-related installed packages
installed_packages = ''
Do i = 1 To list.0
   Do j = 1 To Words( interpreters )
      myint = '-'Word( interpreters, j )
      If Right( list.i, Length( myint ) ) = myint Then installed_packages = installed_packages list.i
   End
End
If packages = 'all' Then
   Do
      base_packages = ''
      last_package = ''
      Do i = 1 To Words( installed_packages )
         p = Word( installed_packages, i )
         Do j = 1 To Words( interpreters )
            myint = '-'Word( interpreters, j )
            Parse Var p 1 rp (myint)
            If Length( rp ) \= Length( p ) Then
               Do
                  p = rp
                  Leave j
               End
         End
         If p \= last_package Then base_packages = base_packages p
         last_package = p
      End
      packages = base_packages
   End
--Say installed_packages
Do i = 1 To Words( packages )
   rcode = ProcessPackage( int, interpreters, Word( packages, i ), installed_packages )
End
Return 0

ProcessPackage: Procedure
Parse Arg int, interpreters, package, installed_packages
pos = Wordpos( int, interpreters )
interpreters = Delword( interpreters, pos, 1 )
-- unlink
Do i = 1 To Words( interpreters )
   Address System 'brew unlink' package'-'Word( interpreters, i )
End
-- link
Address System 'brew link' package'-'int
Return 0
