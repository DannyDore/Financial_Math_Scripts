<#
.SYNOPSIS
Calculates Return on investment (ROI).

.DESCRIPTION
Computes the percentage returned based on an initial investment and the current investment value.

.PARAMETER InitialInvestment
The starting investment amount. Must be greater than 0.

.PARAMETER InvestmentCurrentValue
The current value of the investment. Must be greater than or equal to 0.

.EXAMPLE
.\ReturnOnInvestment.ps1 -InitialInvestment 100 -InvestmentCurrentValue 110

.EXAMPLE
.\ReturnOnInvestment.ps1 (prompts interactively for values)

.NOTES
Author: Danny Dore
Created: 2026-02-14
Version: 1.0.0
#>


# Script Parameters
[CmdletBinding()]
param(
	[Parameter(Mandatory)]
	[ValidateRange(0.01, [double]::MaxValue)]
	[double]$InitialInvestment,

	[Parameter(Mandatory)]
	[ValidateRange(0, [double]::MaxValue)]
	[double]$InvestmentCurrentValue
)

# Imports
# For this script, none

# Global Settings
Set-StrictMode -Version Latest
$VerbosePreference = 'Continue'
$ErrorActionPreference = 'Stop'

# Functions
Function Measure-ReturnOnInvestment {
	[CmdletBinding()]
	Param(
		[Parameter(Mandatory)]
		[ValidateRange(0.01, [double]::MaxValue)]
		[double]$InitialInvestment,

		[Parameter(Mandatory)]
		[ValidateRange(0.00, [double]::MaxValue)]
		[double]$InvestmentCurrentValue
	)
	
	Begin {
		Write-Verbose "Function: $($MyInvocation.MyCommand) started"
	}
	Process {
		Try {
			Write-Verbose "Initial investment: $InitialInvestment"
			Write-Verbose "Current value: $InvestmentCurrentValue"

			$ReturnOnInvestment = (($InvestmentCurrentValue - $InitialInvestment) / $InitialInvestment) * 100
			Write-Verbose "ROI (Return on Investment): $ReturnOnInvestment%"
		}
		Catch {
			Write-Error -Message "Function: $($MyInvocation.MyCommand) failed. Exception: $_"
			throw
		}
	}
	End {
		Write-Verbose "Function: $($MyInvocation.MyCommand) ended"
	}
}

# Execution Function
Function Start-Script {
	Param()
	
	Begin {
		Write-Verbose "Main Execution Section: Started"
	}
	Process {
		Try {
			Measure-ReturnOnInvestment -InitialInvestment $InitialInvestment -InvestmentCurrentValue $InvestmentCurrentValue
		}
		Catch {
			Write-Error -Message "Main Execution failed. Exception: $_"
			throw
		}
	}
	End {
		Write-Verbose "Main Execution Section: Completed"
	}
}

# Execution
Write-Verbose "Script Execution Started"
Try {
	Start-Script
}
Catch {
	throw
} 