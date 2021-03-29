package com.TeamProjects.mapper;

import java.util.ArrayList;

import com.TeamProjects.dto.EventDTO;

public interface EventMapper {

	int eventInsert(EventDTO eDto);

	ArrayList<EventDTO> eventList();

}
