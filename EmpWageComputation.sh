#!/bin/bash -x

#CONSTANTS FOR PROGRAM
isPartTime=1
isFullTime=2
MaxHrsInMonth=50
empRatePerHr=20
numWorkingDays=20

#VARIABLES
totalEmpHrs=0
totalWorkingDays=0

declare -A dailyWage

function getWorkingHrs() {
      case $1 in
         $isFullTime)
            empHrs=8
            ;;
         $isPartTime)
            empHrs=4
            ;;
         *)
            empHrs=0
            ;;
      esac
      echo $empHrs
}

while [[ $totalEmpHrs -lt $MaxHrsInMonth && $totalWorkingDays -lt $numWorkingDays ]]
do
   ((totalWorkingDays++))
   empCheck=$((RANDOM%3))
   empHrs="$( getWorkingHrs $empCheck )"
   totalEmpHrs=$(($totalEmpHrs + $empHrs))
   dailyWage["Day "$totalWorkingDays]=$(($empHrs*$empRatePerHr))
done

totalSalary=$(($totalEmpHrs*$empRatePerHr))
echo "Total salary is $totalSalary"
echo ${dailyWage[@]}
echo ${!dailyWage[@]}
