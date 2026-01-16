//
//  SleepExtensions.swift
//  Arista
//
//  Created by Damien Rivet on 16/01/2026.
//

extension Sleep {

    /// Model transformation > Persistence object to Domain object
    func toDomain() -> SleepSession {
        SleepSession(
            id: id.uuidString,
            duration: duration,
            quality: quality,
            startDate: startDate
        )
    }
}
