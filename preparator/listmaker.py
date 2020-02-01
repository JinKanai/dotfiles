#!/usr/bin/env/python

import os
import json
import sys


class Files:

    def __init__(self):
        dirname_ = os.path.dirname(__file__)
        if not dirname_:
            dirname_ += "."
        self.pkgs_list = dirname_ + '/package_list.json'
        self.install_pkgs = dirname_ + '/basic_pkgs.sh'
        self.requirements = dirname_ + '/requirements.txt'
        print(self.__dict__.values())


class PackageListMaker:

    def __init__(self, files):
        self.files = files
        self.pkgdict = {}
        self.pkgmgr_opt = ' -y install '
        self._confirm_os()
        self.initiator()
        self.packager()
        os.chmod(self.files.install_pkgs, 0o0744)

    def _confirm_os(self):
        if sys.platform == 'darwin':
            self.osname = 'mac'
            self.pkgmgr_opt = ' install '
        elif os.path.exists('/etc/lsb-release'):
            self.osname = 'ubuntu'
        elif os.path.exists('/etc/redhat-release') or os.path.exists('/etc/system-release'):
            self.osname = 'rhel'

    def initiator(self):
        with open(self.files.pkgs_list, 'r') as f:
            self.pkgdict = json.load(f)
        self.writer(self.files.install_pkgs, '#!/bin/bash\n')
        cmd = self.pkgdict[self.osname]['init']
        self.writer(self.files.install_pkgs, cmd)

    def packager(self):
        proc_targets = ['common', self.osname, 'pip']
        for t in proc_targets:
            if t != 'pip':
                pkgmgr = self.pkgdict[self.osname]['pkgmgr']
                pkgs = ' '.join(self.pkgdict[t]['packages'])
                cmd = pkgmgr + self.pkgmgr_opt + pkgs
                if t == 'mac':
                    cmd = cmd + '\n' + pkgmgr + ' cask' + \
                          self.pkgmgr_opt + ' '.join(self.pkgdict[t]['cask'])
                filename = self.files.install_pkgs
            else:
                cmd = '\n'.join(self.pkgdict[t]['packages'])
                filename = self.files.requirements
            self.writer(filename, cmd)

    def writer(self, filename, cmd):
        with open(filename, 'a') as f:
            print(cmd)
            f.write(cmd)
            f.write('\n')


def file_cleanup(files):
    for file_ in files.__dict__.values():
        if 'package_list.json' not in file_:
            try:
                os.remove(file_)
            except Exception as e:
                pass


def main():
    files = Files()
    file_cleanup(files)
    plm = PackageListMaker(files)
    return 0


if __name__ == '__main__':
    sys.exit(main())
