package mysql.issue2.service;

import lombok.RequiredArgsConstructor;
import mysql.issue2.domain.Member;
import mysql.issue2.repository.MemberRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;


    /**
     * userId로 회원 찾기
     */
    public Member findByUserId(String userId) {
        return memberRepository.findByUserId(userId).orElseThrow(() -> {throw new IllegalArgumentException("error");});
    }

}
