import os
import sys
import argparse
import subprocess

def path_exists(path):
    if os.path.exists(path):
        return True
    else:
        return False
        
def run_os_command(command):    
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE)
    process.wait()
    for line in process.stdout:
        print(line.decode('utf-8'))
    if  process.returncode is not 0:
        return False
    else:
        return True

def run_sentinel_apply(sentinel_file,sentinel_bin):
    command = sentinel_bin + ' apply ' + sentinel_file
    print(command)
    status=run_os_command(command)
    return status

def run_sentinel_test(sentinel_file,sentinel_bin):
    command = sentinel_bin + ' test ' + sentinel_file
    print(command)
    status=run_os_command(command)
    return status

def list_sentinel_files(dir):
    objects = os.listdir(dir)
    files = []
    for file in objects:
        if os.path.isfile(os.path.join(dir, file)) and file.endswith(".sentinel"):
            files.append(file)
    return files

def test_all_policies(dir,sentinel_bin):
    files=list_sentinel_files(dir)
    os.chdir(dir)
    result=[]
    for each_file in files:
        """
        if not run_sentinel_apply(each_file,sentinel_bin):
            result.append('Sentinel Apply Failed for : ' + each_file)
        """
        if not run_sentinel_test(each_file,sentinel_bin):
            result.append('Sentinel Test Failed for : ' + each_file)
    print('\n################### RESULT ###################\n')
    if len(result) > 0:
        print('Below Sentinel Policy Checks have Failed : ')
        for each_result in result:
            print(each_result)
        sys.exit(1)
    else:
        print('All Sentinel tests have passed Successfully.')


def main():
    parser = argparse.ArgumentParser(description='Test Sentinel Policies')
    parser.add_argument('--sentinel_bin', help='Location of sentinel binary',required=True)
    parser.add_argument('--sentinel_policy_dir', help='Location of sentinel Polcies',required=True)
    args = parser.parse_args()
    sentinel_bin=args.sentinel_bin
    sentinel_policy_dir=args.sentinel_policy_dir
    if not path_exists(sentinel_policy_dir):
        print(sentinel_policy_dir + ' Doesnt Exist')
        sys.exit(1)
    print('\n################### START ###################\n')
    test_all_policies(sentinel_policy_dir,sentinel_bin)

if __name__ == '__main__':
    main()