Select * From dbo.CovidDeaths$

Select location, date, new_cases, total_cases, new_deaths, total_deaths, new_tests, total_tests, population 
From dbo.CovidDeaths$
Where continent is not null and location ='France'
Order by 1,2

--Select location, total_deaths, sum(new_cases) as totalcase_bysum, max(total_cases) as totalcase_bymax, 
--sum(cast(new_deaths as int)) as totaldeath_bysum, max(total_deaths) as totaldeath_bymax
--From dbo.CovidDeaths$
--Where continent is not null
--Group by location,total_deaths
--Order by 1,2

--Select location, sum(new_cases) as totalcase_bysum, max(total_cases) as totalcase_bymax, 
--sum(cast(new_deaths as int)) as totaldeath_bysum, max(total_deaths) as totaldeath_bymax
--From dbo.CovidDeaths$
--Where continent is not null
--Group by location
--Order by 1,2

--Select location,max(population)
--From dbo.CovidDeaths$
--Where continent is not null
--group by location
--Order by 1,2

--Select location, max(total_cases), max(total_deaths), population 
--From dbo.CovidDeaths$
--Where continent is not null
--group by location, population
--Order by 1,2


--Global number ��
Select sum(new_cases) as TotalCase, sum(cast(new_deaths as float)) as TotalDeaths, max(population) as TotalPopulation,
sum(cast(new_deaths as float))/(sum(new_cases))*100 as DeathPercentageCase, sum(cast(new_deaths as float))/(max(population))*100 as 
DeathPerPopulation,(sum(new_cases))/(max(population))*100 as CasePerPopulation
From dbo.CovidDeaths$
Where continent is not null
--Order by 1,2

--����� �� covid ���ǡ�� % �����
--Select location, Max(total_cases) as TotalCase, Max(total_deaths) as TotalDeath, 
--population, Max(total_deaths)/Max(total_cases)*100 as DeathperCase, (max(total_cases)/population)*100 as TotalCasePerPopulation,
--(max(total_deaths)/population)*100 as TotalDeathPerPopulation
--From dbo.CovidDeaths$
--Where continent is not null
--group by location,population
--Order by 1,2

--������ա�� test ������� covid ��� percent ��ѹ���

--Select location, date, new_cases, new_tests, total_cases, total_tests, population , 
--(total_cases/total_tests)*100 as TotalTestPerTotalCase, (new_cases/new_tests)*100 as NewCasePerNewsTest
--From dbo.CovidDeaths$
--Where continent is not null
--Order by 1,2

--����� Case ��������ͨӹǹ��Ъҡû�����˹�Դ�����ش ��

Select location, Max(total_cases) as TotalCase, population, (max(total_cases)/population)*100 as TotalCasePer
From dbo.CovidDeaths$
Where continent is not null
Group by location, population
Order by TotalCasePer desc


--�� �� totaldeathpercentage
Select location, sum(cast(new_deaths as int)) as TotalDeaths, population, (sum(cast(new_deaths as int)/population))*100 as TotalDeathPer
From dbo.CovidDeaths$
Where continent is not null
Group by location, population
Order by TotalDeathPer desc

--������˹�Դ����
Select location, Max(total_cases) as TotalCase
From dbo.CovidDeaths$
Where continent is not null
Group by location
Order by TotalCase desc

--�� �� totaldeath ������
Select location, sum(cast(new_deaths as int)) as TotalDeath
From dbo.CovidDeaths$
Where continent is not null
Group by location
Order by TotalDeath desc

--Select location, max(total_deaths) as TotalDeath
--From dbo.CovidDeaths$
--Where continent is not null
--Group by location
--Order by TotalDeath desc

--Select location, max(total_deaths) as TotalDeath
--From dbo.CovidDeaths$
--Where continent is not null
--Group by location
--Order by TotalDeath desc

--�����з�ջ�ѹ�˹������� ��

Select location, sum(cast(new_deaths as int)) as TotalDeath
From dbo.CovidDeaths$
Where continent is null and location not in('World','European Union','International')
Group by location
Order by TotalDeath desc

--�����з�ջ�ѹ�˹Case���� ��
Select location, sum(cast(new_cases as int)) as TotalCase
From dbo.CovidDeaths$
Where continent is null and location not in('World','European Union','International')
Group by location
Order by TotalCase desc

--�����������ѹ�Դ�ѹ��� Percent ��

Select location, date, total_cases as TotalCase, population, max((total_cases/population))*100 as TotalCasePer
From dbo.CovidDeaths$
Where continent is not null
Group by location, population, date, total_cases
Order by TotalCasePer desc
--Order by 1,2


--���ʹ�ʹ����ѹ
Select location, date, total_deaths as TotalDeaths, population, (sum(cast(new_deaths as int)/population))*100 as TotalCasePer
From dbo.CovidDeaths$
Where continent is not null
Group by location, population, date, total_deaths
Order by TotalCasePer desc


--use over Partion By ���ʹ� ����л�����ա��������鹢ͧ case ������ѹ���ʹ�����������

--Select location,date , total_cases, Sum(total_cases) OVER (Partition by location Order by location,date) as totalcasePerLocation
--From dbo.CovidDeaths$
--Where continent is not null
--Order by 1,2

