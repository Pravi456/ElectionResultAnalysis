Create Database Election_Results

Use Election_Results
Go

Select * From constituencywise_details

Select * From constituencywise_results

Select * From partywise_results

Select * From states

Select * From statewise_results


--1.Total Seats

Select
    Distinct Count(Parliament_Constituency) Total_Seats
From 
    constituencywise_results

--2.What is the total number of seats available for elections in each state

Select
    s.State State_Name,
    Count(cr.Constituency_ID) As Total_Seats_Available
From
    constituencywise_results cr
Inner Join 
    statewise_results sr On cr.Parliament_Constituency = sr.Parliament_Constituency
Inner Join
    states s On sr.State_ID = s.State_ID
Group By
    s.State
Order By
    s.State


--3.Total Seats Won by NDA Allianz

Select
    Count(Parliament_Constituency) NDA_Total_Seats_Won
From
    constituencywise_results cr
Inner Join
    partywise_results pr On cr.Party_ID = pr.Party_ID
Where Party In (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            )

--4.Seats Won by NDA Allianz Parties

Select
    Party As Party_Name,
	Won As Seats_Won
From
    partywise_results

Where Party In (
        'Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM'
    )
Order By 
    Seats_Won desc

--5.Total Seats Won by I.N.D.I.A. Allianz

Select
    Count(cr.Parliament_Constituency) INDIA_total_Seats_Won
From 
    constituencywise_results cr
Inner Join
    partywise_results pr
On 
    cr.Party_ID = pr.Party_ID
Where Party In (
        'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
    )

--6.Seats Won by I.N.D.I.A. Allianz Parties

Select
    Party Party_Name,
	Won Seats_Won
From
    partywise_results
Where
    Party In (
        'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
    )
Order By Seats_Won Desc

--7.Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

Select *
From partywise_results

--Add New Column

Alter Table partywise_results
Add Party_alliance Varchar(50)

--NDA Alliance

Update
    partywise_results
Set
    Party_alliance = 'NDA'
Where 
    Party In (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            )

--INDIA Alliance

Update 
    partywise_results
Set
    Party_alliance = 'I.N.D.I.A'
Where
    Party In (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
)

--OTHER

Update 
    partywise_results
Set
    Party_alliance = 'OTHER'
Where
    Party_alliance Is NULL

--8.Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?

Select
    pr.Party_alliance,
    Count(cr.Constituency_Name) Seats_Won	
From
    constituencywise_results cr
Inner Join
    partywise_results pr
On cr.Party_ID = pr.Party_ID
Group By
    pr.Party_alliance
Order By
    Seats_Won Desc

--9.Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?

Select
    cr.Winning_Candidate,
	pr.Party,
	pr.Party_alliance,
	cr.Total_Votes,
	cr.Margin,
	s.State,
	cr.Constituency_Name

From
    partywise_results pr
Inner Join
    constituencywise_results cr
On cr.Party_ID = pr.Party_ID
Inner Join
    statewise_results sr
On sr.Parliament_Constituency = cr.Parliament_Constituency
Inner Join
    states s
On s.State_ID = sr.State_ID
Where
    s.State = 'Andhra Pradesh' And cr.Constituency_Name = 'AMALAPURAM(SC)'

--10.What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?

Select 
    cd.Candidate,
	cd.Party,
	cd.EVM_Votes,
	cd.Postal_Votes,
	cd.Total_Votes,
	cr.Constituency_Name
From
    constituencywise_details cd
Inner Join
    constituencywise_results cr
On cd.Constituency_ID = cr.Constituency_ID
Where
    cr.Constituency_Name = 'AMALAPURAM(SC)'

--11.Which parties won the most seats in s State, and how many seats did each party win?

Select
    pr.Party Party_Name,
	Count( cr.Constituency_Name) Seats_Won
From
    partywise_results pr
Inner Join
    constituencywise_results cr
On cr.Party_ID = pr.Party_ID
Inner Join
    statewise_results sr
On cr.Parliament_Constituency = sr.Parliament_Constituency
Inner Join
    states s
On sr.State_ID = s.State_ID
Where
    s.State = 'Andhra Pradesh'
Group By
    pr.Party
Order By 
    Seats_Won Desc

--12.What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) 
--in each state for the India Elections 2024
select
    State,
	isnull([NDA],0) NDA_Won,
	isnull([I.N.D.I.A],0) INDIA_Won,
	isnull([OTHER],0) OTHER_Won
From(
Select 
    s.State,
	pr.Party_alliance
	
From
partywise_results pr
inner join
constituencywise_results cr
On pr.Party_ID = cr.Party_ID
inner join
statewise_results sr
on cr.Parliament_Constituency = sr.Parliament_Constituency
inner join
states s
On sr.State_ID = s.State_ID
) as sourcetable
Pivot
(Count(Party_alliance)
For Party_alliance In ([NDA],[I.N.D.I.A],[OTHER])
) AS PivotTable


--USING CTE

With cte As (
Select
    s.State,
	pr.Party_alliance
From
partywise_results pr
Inner Join
constituencywise_results cr
On pr.Party_ID = cr.Party_ID
Inner Join
statewise_results sr
On cr.Parliament_Constituency = sr.Parliament_Constituency
Inner Join
states s
On sr.State_ID = s.State_ID)

Select 
    State,
	Isnull([NDA],0) NDA_Won,
	Isnull([I.N.D.I.A],0) INDIA_Won,
	Isnull([OTHER],0) OTHER_Won
From 
    cte

Pivot
(
 Count(Party_alliance)
 For Party_alliance In ([NDA],[I.N.D.I.A],[OTHER])

 ) As PivotTable

--13.Which candidate received the highest number of EVM votes in each constituency (Top 10)?

Select Top 10
	cr.Constituency_ID,
	cr.Constituency_Name,
	cd.Candidate Candidate_Name,
	Max(cd.EVM_Votes) EVM_Votes
From 
    constituencywise_details cd
Inner Join
    constituencywise_results cr
On cd.Constituency_ID = cr.Constituency_ID
Group By
    cd.Candidate,
	cr.Constituency_ID,
	cr.Constituency_Name
Order By
    EVM_Votes desc

--14.Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?

Select * From constituencywise_results
Select * From constituencywise_details

Select
    Distinct cr.Constituency_Name,
	sr.Leading_Candidate Winning_Candidate,
	sr.Trailing_Candidate Runnerup_Candidate
From
    constituencywise_details cd
Inner Join
    constituencywise_results cr
On cd.Constituency_ID = cr.Constituency_ID
Inner Join
    partywise_results pr
	On cr.Party_ID = pr.Party_ID
Inner join
    statewise_results sr
On cr.Parliament_Constituency = sr.Parliament_Constituency
Inner join
    states s
On sr.State_ID = s.State_ID
Where 
    s.State = 'Andhra Pradesh'
Order By
    cr.Constituency_Name

--Or


WITH RankedCandidates AS (
    Select
	    cd.Constituency_ID,
		cr.Constituency_Name,
		cd.Candidate,
		cd.Party,
		cd.EVM_Votes,
		cd.Postal_Votes,
		cd.EVM_Votes + cd.Postal_Votes Total_Votes,
        ROW_NUMBER() Over (Partition By cd.Constituency_ID Order By cd.EVM_Votes + cd.Postal_Votes Desc) Rnk
	From
	    constituencywise_details cd
	Inner join
	    constituencywise_results cr On cd.Constituency_ID = cr.Constituency_ID
	Inner Join
	    statewise_results sr On cr.Parliament_Constituency = sr.Parliament_Constituency
    Inner Join
	    states s On sr.State_ID = s.State_ID
	Where 
	    s.State = 'Andhra Pradesh'
)	

Select
    cr.Constituency_Name,
	Max(Case When Rc.Rnk = 1 Then Rc.Candidate End) Winning_candidate,
	Max(Case When Rc.Rnk = 2 Then Rc.Candidate End) Runnerup_candidate
From
    RankedCandidates Rc
Inner Join
    constituencywise_results cr On Rc.Constituency_ID = cr.Constituency_ID
Group By
    cr.Constituency_Name
Order By
    cr.Constituency_Name

--15.For the state of Andhrapradesh, what are the total number of seats, total number of candidates, total number of parties, 
--total votes (including EVM and postal), and the breakdown of EVM and postal votes?

Select
    s.state,
    Count(Distinct cr.Parliament_Constituency) Total_Seats,
	Count(Distinct cd.Candidate) Total_candidates,
	Count(Distinct pr.Party) Total_Parties,
	Sum(cd.EVM_Votes + cd.Postal_Votes) Total_Votes,
	Sum(cd.EVM_Votes) Total_evm_Votes,
	Sum(cd.Postal_Votes) Total_Postal_Votes
From
    constituencywise_results cr
Inner Join
    constituencywise_details cd
On cr.Constituency_ID = cd.Constituency_ID
Inner Join
    partywise_results pr
On cr.Party_ID = pr.Party_ID
Inner Join
    statewise_results sr
On cr.Parliament_Constituency = sr.Parliament_Constituency
Inner Join
    states s
On sr.State_ID = s.State_ID
Where
    s.State = 'Andhra Pradesh'
Group By
    s.State