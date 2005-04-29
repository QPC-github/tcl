# Tcl package index file, version 1.1
# This file was generated by hand.
# 
# This file is used by makefile.vc until that properly auto-generates it.
# pkgIndex.tcl.in is used instead of configure-based builds.
# Keep in sync with pkgIndex.tcl.in until this goes away.

# We don't really want to throw an error with older versions of
# Tcl, they should just ignore us.
if {[package provide Tcl] < 8.4} {
    return
}
package require Tcl 8.4

namespace eval ::vfs {}
variable vfs::dll

if {$::tcl_platform(platform) eq "unix"} {
    if {[info exists ::tcl_platform(debug)]} {
	set dll libvfs1.3g
    } else {
	set dll libvfs1.3
    }
} elseif {[info exists ::tcl_platform(debug)]} {
    set dll vfs13g
} else {
    set dll vfs13
}
if {![info exists dir]} {
    set dir [file dirname [info script]]
}
set dll [file join $dir $dll[info sharedlibextension]]

proc loadvfs {dir dll} {
    global auto_path
    if {[lsearch -exact $auto_path $dir] == -1} {
	lappend auto_path $dir
    }
    if {![file exists $dll]} { return }
    set dir [file dirname $dll]
    if {[lsearch -exact $auto_path $dir] == -1} {
	lappend auto_path $dir
    }
    load $dll
}

package ifneeded vfs        1.3.0 [list loadvfs $dir $dll]
package ifneeded starkit    1.3.1 [list source [file join $dir starkit.tcl]]
package ifneeded vfslib     1.3.1 [list source [file join $dir vfslib.tcl]]

# Old
package ifneeded mk4vfs       1.9 [list source [file join $dir mk4vfs.tcl]]
package ifneeded zipvfs       1.0 [list source [file join $dir zipvfs.tcl]]

# New
package ifneeded vfs::ftp     1.0 [list source [file join $dir ftpvfs.tcl]]
package ifneeded vfs::http    0.5 [list source [file join $dir httpvfs.tcl]]
package ifneeded vfs::mk4     1.9 [list source [file join $dir mk4vfs.tcl]]
package ifneeded vfs::ns      0.5 [list source [file join $dir tclprocvfs.tcl]]
package ifneeded vfs::tar     0.9 [list source [file join $dir tarvfs.tcl]]
package ifneeded vfs::test    1.0 [list source [file join $dir testvfs.tcl]]
package ifneeded vfs::urltype 1.0 [list source [file join $dir vfsUrl.tcl]]
package ifneeded vfs::webdav  0.1 [list source [file join $dir webdavvfs.tcl]]
package ifneeded vfs::zip     1.0 [list source [file join $dir zipvfs.tcl]]
package ifneeded vfs::tk      0.5 [list source [file join $dir tkvfs.tcl]]
