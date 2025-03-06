import streamlit as st
import pandas as pd
import altair as alt
import mysql.connector

# Function to connect to the MySQL database
def get_database_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="DbmsMysql@13254",  # Replace with your actual password
        database="database_laliga"    # Replace with your actual database name
    )

# Function to retrieve data from top_10_assist_leaders stored procedure
def fetch_top_10_assist_leaders():
    conn = get_database_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('top_10_assist_leaders')
    
    # Fetch results
    for result in cursor.stored_results():
        data = result.fetchall()
    cursor.close()
    conn.close()
    return pd.DataFrame(data)

# Function to retrieve data from top_10_goal_scorers stored procedure
def fetch_top_10_goal_scorers():
    conn = get_database_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('top_10_goal_scorers')
    
    # Fetch results
    for result in cursor.stored_results():
        data = result.fetchall()
    cursor.close()
    conn.close()
    return pd.DataFrame(data)

# Main function to create the Streamlit app
def main():
    st.title("Top 10 Football Players")

    # Fetch data
    assist_leaders = fetch_top_10_assist_leaders()
    goal_scorers = fetch_top_10_goal_scorers()

    # Display top 10 assist leaders
    st.subheader("Top 10 Assist Leaders")
    st.dataframe(assist_leaders)
    
    # Create and display bar chart for assist leaders
    assist_chart = alt.Chart(assist_leaders).mark_bar().encode(
        x=alt.X("Assists_Provided:Q", title="Assists Provided"),
        y=alt.Y("Player_Name:N", sort='-x', title="Player Name")
    ).properties(
        width=600,
        height=400,
        title="Top 10 Players by Assists"
    )
    st.altair_chart(assist_chart)

    # Display top 10 goal scorers
    st.subheader("Top 10 Goal Scorers")
    st.dataframe(goal_scorers)
    
    # Create and display bar chart for goal scorers
    goals_chart = alt.Chart(goal_scorers).mark_bar().encode(
        x=alt.X("Goals_Scored:Q", title="Goals Scored"),
        y=alt.Y("Player_Name:N", sort='-x', title="Player Name")
    ).properties(
        width=600,
        height=400,
        title="Top 10 Players by Goals Scored"
    )
    st.altair_chart(goals_chart)

if __name__ == "__main__":
    main()