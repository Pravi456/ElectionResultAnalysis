# INDIA GENERAL ELECTIONS RESULT ANALYSIS 2024 - README

## Overview
This document contains SQL queries used to analyze the results of the India General Elections 2024. The queries retrieve data on total seats, party alliances, election winners, vote distribution, and other election statistics.

## Content Breakdown
1. **Total Seats**  
   - Query to count the total number of parliamentary constituencies.

2. **Total Seats Available by State**  
   - Retrieves the total number of seats available for elections in each state.

3. **Total Seats Won by NDA Alliance**  
   - Determines the number of seats won by the NDA alliance.

4. **Seats Won by NDA Alliance Parties**  
   - Lists the number of seats won by each NDA alliance party.

5. **Total Seats Won by I.N.D.I.A. Alliance**  
   - Determines the number of seats won by the I.N.D.I.A. alliance.

6. **Seats Won by I.N.D.I.A. Alliance Parties**  
   - Lists the number of seats won by each I.N.D.I.A. alliance party.

7. **Adding Party Alliance Column to the Database**  
   - Updates the database to classify parties under NDA, I.N.D.I.A, or OTHER alliances.

8. **Which Party Alliance Won the Most Seats?**  
   - Aggregates the total seats won by NDA, I.N.D.I.A, and OTHER alliances.

9. **Winning Candidate Details for a Specific Constituency**  
   - Retrieves the winning candidate's name, party, total votes, and margin of victory for a given state and constituency.

10. **EVM vs Postal Votes Distribution**  
   - Retrieves data on the distribution of EVM and postal votes for candidates in a specific constituency.

11. **Party-wise Seat Count for a Specific State**  
   - Lists the total number of seats won by each party in a given state.

12. **Total Seats Won by Each Party Alliance in Each State**  
   - Provides a breakdown of seats won by NDA, I.N.D.I.A, and OTHER alliances per state.

13. **Top 10 Candidates with Highest EVM Votes**  
   - Retrieves the top 10 candidates who received the highest number of EVM votes.

14. **Winning and Runner-Up Candidate in Each Constituency**  
   - Identifies the winner and runner-up in each constituency of a given state.

15. **Andhra Pradesh Election Summary**  
   - Provides statistics for Andhra pradesh, including total seats, total candidates, total parties, and vote breakdown.

## Usage Instructions
- Run the SQL queries on the election results database to generate analytical reports.
- Modify the queries as needed to filter by specific states, parties, or candidates.
- Ensure that the database schema includes tables such as `constituencywise_results`, `partywise_results`, `statewise_results`, and `states` before executing queries.

## Author
**Created By:** Sainadh

